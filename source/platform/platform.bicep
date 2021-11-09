
param apiManagementServiceName string = 'vulture-dev-apimservice'
param location string = resourceGroup().location

param sku string = 'Standard'
param skuCount int = 1

param resourceTags object = {
  Application: 'Vulture-API'
  CostCenter: 'Az-Sales'  
  Environment: 'Development'
  Owner: 'Moim.Hossain@microsoft.com'
}


module apimService 'core/apim-service.bicep' = {
  name: 'apimservice'
  params: {
    apiManagementServiceName: apiManagementServiceName
    location: location
    sku: sku
    skuCount: skuCount
    resourceTags: resourceTags
  }
}


module servicePolicies 'policies/platform-policies.bicep' = {
  name: '${apimService.name}-service-policy'  
  params: {
    apiManagementService: apiManagementServiceName
  }  
}


module products 'products/products.bicep' = {
  name: 'products'  
  params: {
    apiManagementServiceName: apiManagementServiceName
  }  
}
