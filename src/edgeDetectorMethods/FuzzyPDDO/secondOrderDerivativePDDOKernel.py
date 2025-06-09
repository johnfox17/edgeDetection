import numpy as np
from sklearn.neighbors import KDTree
from numpy.linalg import solve
import os

dx = 1
dy = 1
bVec20 = np.array([0, 0, 0, 2, 0, 0])
bVec02 = np.array([0, 0, 0, 0, 2, 0])
#kernelDim = int(kernelDim)
kernelDim = 7
sigma =2
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
    diffMat = np.zeros([6,6])
    g20 = []
    g02 = []
    for iNode in range(len(PDDOKernelMesh)):
        currentXXi = xXis[iNode]
        currentYXi = yXis[iNode]
        xiMag = np.sqrt(currentXXi**2+currentYXi**2)
        pList = np.array([1, currentXXi/deltaMag, currentYXi/deltaMag, (currentXXi/deltaMag)**2, \
                    (currentYXi/deltaMag)**2, (currentXXi/deltaMag)*(currentYXi/deltaMag)])
        weight = (1/sigma)*np.exp(-0.5*((xiMag)/sigma)**2)
        diffMat += weight*np.outer(pList,pList)*dx*dy
        
    for iNode in range(len(PDDOKernelMesh)):
        currentXXi = xXis[iNode]
        currentYXi = yXis[iNode]
        xiMag = np.sqrt(currentXXi**2+currentYXi**2)
        pList = np.array([1, currentXXi/deltaMag, currentYXi/deltaMag, (currentXXi/deltaMag)**2, \
                    (currentYXi/deltaMag)**2, (currentXXi/deltaMag)*(currentYXi/deltaMag)])
        weight = (1/sigma)*np.exp(-0.5*((xiMag)/sigma)**2)
        g20.append((dx*dy/np.sqrt(2))*weight*(np.inner(solve(diffMat,bVec20), pList)))
        g02.append((dx*dy/np.sqrt(2))*weight*(np.inner(solve(diffMat,bVec02), pList)))
    g20 = np.array(g20).reshape((kernelDim,kernelDim))
    g02 = np.array(g02).reshape((kernelDim,kernelDim))
    
    return g20, g02 
 
def calculate(sigma):
    PDDOKernelMesh = createPDDOKernelMesh()
    xXis, yXis = calculateXis(PDDOKernelMesh)
    return calculateGPolynomials(PDDOKernelMesh, xXis, yXis, sigma)

g20, g02 = calculate(sigma)

outputPath = '../data/output/PDDOKernel/'
os.makedirs(outputPath, exist_ok=True)

np.savetxt(outputPath + 'g20.csv', g20, delimiter=",")
np.savetxt(outputPath + 'g02.csv', g02, delimiter=",")
