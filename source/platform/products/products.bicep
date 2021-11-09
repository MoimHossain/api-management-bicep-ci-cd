
param apiManagementServiceName string

module vulturePetstoreProduct 'vulture-petstore/vulture-petstore.bicep' = {
  name: '${apiManagementServiceName}-product'  
  params: {
    apiManagementServiceName: apiManagementServiceName
  }  
}
