
param apiManagementServiceName string

var productName = 'vulture-petstore'

resource vulturePetStoreProduct 'Microsoft.ApiManagement/service/products@2020-06-01-preview' = {
  name: '${apiManagementServiceName}/${productName}'
  properties: {
    displayName: 'Vulture Petstore Product'
    description: 'VUlture Petstore API proxied to Petstore API online'
    terms: 'Vulture PetStore Pet'
    subscriptionRequired: true
    approvalRequired: false
    subscriptionsLimit: 1
    state: 'published'    
  }
}

module subscriptions 'subscriptions/demoSubscriptions.bicep' = {
  name: 'vulture-petstore-subscription'
  params: {
    apiManagementServiceName: apiManagementServiceName
    productId: vulturePetStoreProduct.id
    subscriptionName: 'vulture-petstore-subscription'
  }
}

module petstoreApi 'apis/petstore/petstore.bicep' = {
  name: 'petstore-api'
  dependsOn: [
    vulturePetStoreProduct
  ]
  params: {
    apiManagementServiceName: apiManagementServiceName
    productName: productName
  }
}

module employeeApi 'apis/employee/employee.bicep' = {
  name: 'employee-api'
  dependsOn: [
    vulturePetStoreProduct
  ]
  params: {
    apiManagementServiceName: apiManagementServiceName
    productName: productName
  }  
}
