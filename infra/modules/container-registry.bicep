@description('Location for the container registry.')
param location string

@description('Tags for the container registry.')
param tags object

@description('Name of the container registry. Must be globally unique, 5-50 alphanumeric characters.')
param name string

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2023-07-01' = {
  name: name
  location: location
  tags: tags
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: false
  }
}

output name string = containerRegistry.name
output loginServer string = containerRegistry.properties.loginServer
output id string = containerRegistry.id
