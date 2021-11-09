
param apiManagementServiceName string
param location string = resourceGroup().location

param publisherEmail string = 'moim.hossain@microsoft.com'
param publisherName string = 'Vulture Inc.'
param sku string
param skuCount int

param resourceTags object 

resource apiManagementService 'Microsoft.ApiManagement/service@2020-06-01-preview' = {
  name: apiManagementServiceName
  location: location
  sku: {
    name: sku
    capacity: skuCount
  }
  properties: {
    publisherName: publisherName
    publisherEmail: publisherEmail
  }
  tags: resourceTags
}
