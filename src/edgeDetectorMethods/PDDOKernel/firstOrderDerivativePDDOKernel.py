import numpy as np
from sklearn.neighbors import KDTree
from numpy.linalg import solve
import os

dx = 1
dy = 1
bVec10 = np.array([0, 1, 0])
bVec01 = np.array([0, 0, 1])
kernelDim = int(kernelDim)
horizon = (kernelDim**2-1)/2 + 0.015

deltaX = horizon*dx
deltaY = horizon*dy

def createPDDOKernelMesh():
    indexing = 'xy'
    xCoords = np.arange(0, (kernelDim-1)/2+1, 1)
    xCoords = np.append(xCoords, np.arange(-(kernelDim-1)/2,0, 1))
    yCoords = np.arange(0, (kernelDim-1)/2+1, 1)
    yCoords = np.append(yCoords, np.arange( -(kernelDim-1)/2, 0, 1))
    xCoords, yCoords = np.meshgrid(xCoords, yCoords, indexing=indexing)
    xCoords = xCoords.reshape(-1, 1)
    yCoords = yCoords.reshape(-1, 1)
    return np.array([xCoords[:,0], yCoords[:,0]]).T
    
def calculateXis(PDDOKernelMesh):
    midPDDONodeCoords = PDDOKernelMesh[0,:]
    xXis = PDDOKernelMesh[:,0]-midPDDONodeCoords[0]
    yXis = PDDOKernelMesh[:,1]-midPDDONodeCoords[1]
    return xXis, yXis

def calculateGPolynomials(PDDOKernelMesh, xXis, yXis, sigma):
    deltaMag = np.sqrt(deltaX**2 + deltaY**2)
    diffMat = np.zeros([3,3])
    g10 = []
    g01 = []
    for iNode in range(len(PDDOKernelMesh)):
        currentXXi = xXis[iNode]
        currentYXi = yXis[iNode]
        xiMag = np.sqrt(currentXXi**2+currentYXi**2)
        pList = np.array([1, currentXXi, currentYXi])
        weight = (1/sigma)*np.exp(-0.5*((xiMag)/sigma)**2)
        diffMat += weight*np.outer(pList,pList)*dx*dy
        
    for iNode in range(len(PDDOKernelMesh)):
        currentXXi = xXis[iNode]
        currentYXi = yXis[iNode]
        xiMag = np.sqrt(currentXXi**2+currentYXi**2)
        pList = np.array([1, currentXXi, currentYXi])
        weight = (1/sigma)*np.exp(-0.5*((xiMag)/sigma)**2)
        g10.append((dx*dy/np.sqrt(2))*weight*(np.inner(solve(diffMat,bVec10), pList)))
        g01.append((dx*dy/np.sqrt(2))*weight*(np.inner(solve(diffMat,bVec01), pList)))
    g10 = np.array(g10).reshape((kernelDim,kernelDim))
    g01 = np.array(g01).reshape((kernelDim,kernelDim))
    
    return g10, g01 
 
def calculate(sigma):
    PDDOKernelMesh = createPDDOKernelMesh()
    xXis, yXis = calculateXis(PDDOKernelMesh)
    return calculateGPolynomials(PDDOKernelMesh, xXis, yXis, sigma)

g10, g01 = calculate(sigma)

outputPath = '../data/output/PDDOKernel/'
os.makedirs(outputPath, exist_ok=True)

np.savetxt(outputPath + 'g10.csv', g10, delimiter=",")
np.savetxt(outputPath + 'g01.csv', g01, delimiter=",")
