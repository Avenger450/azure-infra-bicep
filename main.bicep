@secure()
param vulnerabilityAssessments_Default_storageContainerPath string
param vaults_ADB_Testing_name string = 'ADB-Testing'
param servers_sql_srvr_vb_dev_anu_name string = 'sql-srvr-vb-dev-anu'
param workspaces_ADB_DEV_VB_name string = 'ADB-DEV-VB'
param storageAccounts_blobvbdevsnow_name string = 'blobvbdevsnow'
param storageAccounts_adlsdevvbsorce001_name string = 'adlsdevvbsorce001'
param storageAccounts_adlsdevisionboardraw01an_name string = 'adlsdevisionboardraw01an'
param userAssignedIdentities_mi_dbx_uc_adlsdevvbsorce001_name string = 'mi-dbx-uc-adlsdevvbsorce001'
param systemTopics_blobvbdevsnow_ba7dfe67_6fae_41c1_9ae9_5c547d6986ad_name string = 'blobvbdevsnow-ba7dfe67-6fae-41c1-9ae9-5c547d6986ad'

resource workspaces_ADB_DEV_VB_name_resource 'Microsoft.Databricks/workspaces@2025-03-01-preview' = {
  name: workspaces_ADB_DEV_VB_name
  location: 'centralindia'
  sku: {
    name: 'premium'
  }
  properties: {
    defaultCatalog: {
      initialType: 'UnityCatalog'
    }
    managedResourceGroupId: '/subscriptions/fd21e095-163b-4c44-9a1f-2f9e3882ccee/resourceGroups/databricks-rg-${workspaces_ADB_DEV_VB_name}-3p6i53udbagzw'
    parameters: {
      enableNoPublicIp: {
        value: true
      }
      prepareEncryption: {
        value: false
      }
      requireInfrastructureEncryption: {
        value: false
      }
      storageAccountName: {
        value: 'dbstoragezpabp5hwg42k6'
      }
      storageAccountSkuName: {
        value: 'Standard_GRS'
      }
    }
    authorizations: [
      {
        principalId: '9a74af6f-d153-4348-988a-e2672920bee9'
        roleDefinitionId: '8e3af657-a8ff-443c-a75c-2fe8c4bcb635'
      }
    ]
    createdBy: {}
    updatedBy: {}
  }
}

resource vaults_ADB_Testing_name_resource 'Microsoft.KeyVault/vaults@2024-12-01-preview' = {
  name: vaults_ADB_Testing_name
  location: 'centralindia'
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: 'e4282c07-c56b-4a52-aaab-c46e3435b3b8'
    networkAcls: {
      bypass: 'None'
      defaultAction: 'Allow'
      ipRules: []
      virtualNetworkRules: []
    }
    accessPolicies: [
      {
        tenantId: 'e4282c07-c56b-4a52-aaab-c46e3435b3b8'
        objectId: 'c0c6f336-5f05-46dd-84f2-bba5a0444063'
        permissions: {
          secrets: [
            'get'
            'list'
          ]
        }
      }
    ]
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    enableRbacAuthorization: true
    vaultUri: 'https://adb-testing.vault.azure.net/'
    provisioningState: 'Succeeded'
    publicNetworkAccess: 'Enabled'
  }
}

resource userAssignedIdentities_mi_dbx_uc_adlsdevvbsorce001_name_resource 'Microsoft.ManagedIdentity/userAssignedIdentities@2025-01-31-preview' = {
  name: userAssignedIdentities_mi_dbx_uc_adlsdevvbsorce001_name
  location: 'centralindia'
}

resource servers_sql_srvr_vb_dev_anu_name_resource 'Microsoft.Sql/servers@2024-05-01-preview' = {
  name: servers_sql_srvr_vb_dev_anu_name
  location: 'centralindia'
  kind: 'v12.0'
  properties: {
    administratorLogin: 'access-data-dev'
    version: '12.0'
    minimalTlsVersion: '1.2'
    publicNetworkAccess: 'Enabled'
    restrictOutboundNetworkAccess: 'Disabled'
  }
}

resource storageAccounts_adlsdevisionboardraw01an_name_resource 'Microsoft.Storage/storageAccounts@2025-01-01' = {
  name: storageAccounts_adlsdevisionboardraw01an_name
  location: 'centralindia'
  sku: {
    name: 'Standard_RAGRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    dnsEndpointType: 'Standard'
    defaultToOAuthAuthentication: false
    publicNetworkAccess: 'Enabled'
    allowCrossTenantReplication: false
    isLocalUserEnabled: true
    isSftpEnabled: true
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    allowSharedKeyAccess: true
    largeFileSharesState: 'Enabled'
    isHnsEnabled: true
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      requireInfrastructureEncryption: false
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource storageAccounts_adlsdevvbsorce001_name_resource 'Microsoft.Storage/storageAccounts@2025-01-01' = {
  name: storageAccounts_adlsdevvbsorce001_name
  location: 'centralindia'
  sku: {
    name: 'Standard_RAGRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    dnsEndpointType: 'Standard'
    defaultToOAuthAuthentication: false
    publicNetworkAccess: 'Enabled'
    allowCrossTenantReplication: false
    isSftpEnabled: false
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    allowSharedKeyAccess: true
    largeFileSharesState: 'Enabled'
    isHnsEnabled: true
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      requireInfrastructureEncryption: false
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource storageAccounts_blobvbdevsnow_name_resource 'Microsoft.Storage/storageAccounts@2025-01-01' = {
  name: storageAccounts_blobvbdevsnow_name
  location: 'centralindia'
  sku: {
    name: 'Standard_RAGRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    dnsEndpointType: 'Standard'
    defaultToOAuthAuthentication: false
    publicNetworkAccess: 'Enabled'
    allowCrossTenantReplication: false
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    allowSharedKeyAccess: true
    largeFileSharesState: 'Enabled'
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      requireInfrastructureEncryption: false
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource systemTopics_blobvbdevsnow_ba7dfe67_6fae_41c1_9ae9_5c547d6986ad_name_resource 'Microsoft.EventGrid/systemTopics@2025-04-01-preview' = {
  name: systemTopics_blobvbdevsnow_ba7dfe67_6fae_41c1_9ae9_5c547d6986ad_name
  location: 'centralindia'
  properties: {
    source: storageAccounts_blobvbdevsnow_name_resource.id
    topicType: 'microsoft.storage.storageaccounts'
  }
}

resource systemTopics_blobvbdevsnow_ba7dfe67_6fae_41c1_9ae9_5c547d6986ad_name_c34be007_7a71_c34a_cb28_2d3c852b1f62 'Microsoft.EventGrid/systemTopics/eventSubscriptions@2025-04-01-preview' = {
  parent: systemTopics_blobvbdevsnow_ba7dfe67_6fae_41c1_9ae9_5c547d6986ad_name_resource
  name: 'c34be007-7a71-c34a-cb28-2d3c852b1f62'
  properties: {
    destination: {
      properties: {
        maxEventsPerBatch: 1
        preferredBatchSizeInKilobytes: 64
      }
      endpointType: 'WebHook'
    }
    filter: {
      subjectBeginsWith: '/blobServices/default/containers/input/blobs/'
      includedEventTypes: [
        'Microsoft.Storage.BlobCreated'
      ]
      advancedFilters: [
        {
          values: [
            'CopyBlob'
            'PutBlob'
            'PutBlockList'
            'FlushWithClose'
            'DeleteBlob'
            'CreateFile'
            'DeleteFile'
          ]
          operatorType: 'StringIn'
          key: 'data.api'
        }
        {
          value: json('0')
          operatorType: 'NumberGreaterThan'
          key: 'data.contentLength'
        }
      ]
    }
    eventDeliverySchema: 'EventGridSchema'
    retryPolicy: {
      maxDeliveryAttempts: 30
      eventTimeToLiveInMinutes: 1440
    }
  }
}

resource vaults_ADB_Testing_name_adls_storage_key 'Microsoft.KeyVault/vaults/secrets@2024-12-01-preview' = {
  parent: vaults_ADB_Testing_name_resource
  name: 'adls-storage-key'
  location: 'centralindia'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource vaults_ADB_Testing_name_keytest 'Microsoft.KeyVault/vaults/secrets@2024-12-01-preview' = {
  parent: vaults_ADB_Testing_name_resource
  name: 'keytest'
  location: 'centralindia'
  properties: {
    attributes: {
      enabled: true
    }
  }
}

resource servers_sql_srvr_vb_dev_anu_name_Default 'Microsoft.Sql/servers/advancedThreatProtectionSettings@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

resource servers_sql_srvr_vb_dev_anu_name_CreateIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_sql_srvr_vb_dev_anu_name_DbParameterization 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_sql_srvr_vb_dev_anu_name_DefragmentIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_sql_srvr_vb_dev_anu_name_DropIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_sql_srvr_vb_dev_anu_name_ForceLastGoodPlan 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
}

resource Microsoft_Sql_servers_auditingPolicies_servers_sql_srvr_vb_dev_anu_name_Default 'Microsoft.Sql/servers/auditingPolicies@2014-04-01' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'Default'
  location: 'Central India'
  properties: {
    auditingState: 'Disabled'
  }
}

resource Microsoft_Sql_servers_auditingSettings_servers_sql_srvr_vb_dev_anu_name_Default 'Microsoft.Sql/servers/auditingSettings@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource Microsoft_Sql_servers_connectionPolicies_servers_sql_srvr_vb_dev_anu_name_default 'Microsoft.Sql/servers/connectionPolicies@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'default'
  location: 'centralindia'
  properties: {
    connectionType: 'Default'
  }
}

resource servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev 'Microsoft.Sql/servers/databases@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'sql-db-vb-dev'
  location: 'centralindia'
  sku: {
    name: 'GP_S_Gen5'
    tier: 'GeneralPurpose'
    family: 'Gen5'
    capacity: 1
  }
  kind: 'v12.0,user,vcore,serverless'
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 34359738368
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    autoPauseDelay: 60
    requestedBackupStorageRedundancy: 'Geo'
    minCapacity: json('0.5')
    maintenanceConfigurationId: '/subscriptions/fd21e095-163b-4c44-9a1f-2f9e3882ccee/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
    availabilityZone: 'NoPreference'
  }
}

resource servers_sql_srvr_vb_dev_anu_name_master_Default 'Microsoft.Sql/servers/databases/advancedThreatProtectionSettings@2024-05-01-preview' = {
  name: '${servers_sql_srvr_vb_dev_anu_name}/master/Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingPolicies_servers_sql_srvr_vb_dev_anu_name_master_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  name: '${servers_sql_srvr_vb_dev_anu_name}/master/Default'
  location: 'Central India'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_sql_srvr_vb_dev_anu_name_master_Default 'Microsoft.Sql/servers/databases/auditingSettings@2024-05-01-preview' = {
  name: '${servers_sql_srvr_vb_dev_anu_name}/master/Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_sql_srvr_vb_dev_anu_name_master_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2024-05-01-preview' = {
  name: '${servers_sql_srvr_vb_dev_anu_name}/master/Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_sql_srvr_vb_dev_anu_name_master_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2024-05-01-preview' = {
  name: '${servers_sql_srvr_vb_dev_anu_name}/master/Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource servers_sql_srvr_vb_dev_anu_name_master_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2024-05-01-preview' = {
  name: '${servers_sql_srvr_vb_dev_anu_name}/master/Current'
  properties: {}
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_sql_srvr_vb_dev_anu_name_master_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2024-05-01-preview' = {
  name: '${servers_sql_srvr_vb_dev_anu_name}/master/Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_sql_srvr_vb_dev_anu_name_master_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2024-05-01-preview' = {
  name: '${servers_sql_srvr_vb_dev_anu_name}/master/Current'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_sql_srvr_vb_dev_anu_name_master_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2024-05-01-preview' = {
  name: '${servers_sql_srvr_vb_dev_anu_name}/master/Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource Microsoft_Sql_servers_devOpsAuditingSettings_servers_sql_srvr_vb_dev_anu_name_Default 'Microsoft.Sql/servers/devOpsAuditingSettings@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'Default'
  properties: {
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource servers_sql_srvr_vb_dev_anu_name_current 'Microsoft.Sql/servers/encryptionProtector@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'current'
  kind: 'servicemanaged'
  properties: {
    serverKeyName: 'ServiceManaged'
    serverKeyType: 'ServiceManaged'
    autoRotationEnabled: false
  }
}

resource Microsoft_Sql_servers_extendedAuditingSettings_servers_sql_srvr_vb_dev_anu_name_Default 'Microsoft.Sql/servers/extendedAuditingSettings@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource servers_sql_srvr_vb_dev_anu_name_AllowAllWindowsAzureIps 'Microsoft.Sql/servers/firewallRules@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'AllowAllWindowsAzureIps'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}

resource servers_sql_srvr_vb_dev_anu_name_ClientIPAddress_2025_12_26_20_1_31 'Microsoft.Sql/servers/firewallRules@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'ClientIPAddress_2025-12-26_20-1-31'
  properties: {
    startIpAddress: '103.211.135.115'
    endIpAddress: '103.211.135.115'
  }
}

resource servers_sql_srvr_vb_dev_anu_name_ClientIPAddress_2025_12_29_19_51_46 'Microsoft.Sql/servers/firewallRules@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'ClientIPAddress_2025-12-29_19-51-46'
  properties: {
    startIpAddress: '103.171.247.111'
    endIpAddress: '103.171.247.111'
  }
}

resource servers_sql_srvr_vb_dev_anu_name_ClientIPAddress_2025_12_30_18_41_47 'Microsoft.Sql/servers/firewallRules@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'ClientIPAddress_2025-12-30_18-41-47'
  properties: {
    startIpAddress: '103.171.247.111'
    endIpAddress: '103.171.247.111'
  }
}

resource servers_sql_srvr_vb_dev_anu_name_ClientIPAddress_2026_1_1_17_31_53 'Microsoft.Sql/servers/firewallRules@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'ClientIPAddress_2026-1-1_17-31-53'
  properties: {
    startIpAddress: '103.171.247.111'
    endIpAddress: '103.171.247.111'
  }
}

resource servers_sql_srvr_vb_dev_anu_name_ClientIPAddress_2026_1_5_11_21_59 'Microsoft.Sql/servers/firewallRules@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'ClientIPAddress_2026-1-5_11-21-59'
  properties: {
    startIpAddress: '160.238.92.203'
    endIpAddress: '160.238.92.203'
  }
}

resource servers_sql_srvr_vb_dev_anu_name_ClientIPAddress_2026_1_6_11_16_20 'Microsoft.Sql/servers/firewallRules@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'ClientIPAddress_2026-1-6_11-16-20'
  properties: {
    startIpAddress: '160.238.92.203'
    endIpAddress: '160.238.92.203'
  }
}

resource servers_sql_srvr_vb_dev_anu_name_query_editor_a55df6 'Microsoft.Sql/servers/firewallRules@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'query-editor-a55df6'
  properties: {
    startIpAddress: '103.188.163.204'
    endIpAddress: '103.188.163.204'
  }
}

resource servers_sql_srvr_vb_dev_anu_name_ServiceManaged 'Microsoft.Sql/servers/keys@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'ServiceManaged'
  kind: 'servicemanaged'
  properties: {
    serverKeyType: 'ServiceManaged'
  }
}

resource Microsoft_Sql_servers_securityAlertPolicies_servers_sql_srvr_vb_dev_anu_name_Default 'Microsoft.Sql/servers/securityAlertPolicies@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
}

resource Microsoft_Sql_servers_sqlVulnerabilityAssessments_servers_sql_srvr_vb_dev_anu_name_Default 'Microsoft.Sql/servers/sqlVulnerabilityAssessments@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

resource Microsoft_Sql_servers_vulnerabilityAssessments_servers_sql_srvr_vb_dev_anu_name_Default 'Microsoft.Sql/servers/vulnerabilityAssessments@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_resource
  name: 'Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
    storageContainerPath: vulnerabilityAssessments_Default_storageContainerPath
  }
}

resource storageAccounts_adlsdevisionboardraw01an_name_default 'Microsoft.Storage/storageAccounts/blobServices@2025-01-01' = {
  parent: storageAccounts_adlsdevisionboardraw01an_name_resource
  name: 'default'
  sku: {
    name: 'Standard_RAGRS'
    tier: 'Standard'
  }
  properties: {
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      enabled: true
      days: 7
    }
  }
}

resource storageAccounts_adlsdevvbsorce001_name_default 'Microsoft.Storage/storageAccounts/blobServices@2025-01-01' = {
  parent: storageAccounts_adlsdevvbsorce001_name_resource
  name: 'default'
  sku: {
    name: 'Standard_RAGRS'
    tier: 'Standard'
  }
  properties: {
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      enabled: true
      days: 7
    }
  }
}

resource storageAccounts_blobvbdevsnow_name_default 'Microsoft.Storage/storageAccounts/blobServices@2025-01-01' = {
  parent: storageAccounts_blobvbdevsnow_name_resource
  name: 'default'
  sku: {
    name: 'Standard_RAGRS'
    tier: 'Standard'
  }
  properties: {
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      enabled: true
      days: 7
    }
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_adlsdevisionboardraw01an_name_default 'Microsoft.Storage/storageAccounts/fileServices@2025-01-01' = {
  parent: storageAccounts_adlsdevisionboardraw01an_name_resource
  name: 'default'
  sku: {
    name: 'Standard_RAGRS'
    tier: 'Standard'
  }
  properties: {
    protocolSettings: {
      smb: {}
    }
    cors: {
      corsRules: []
    }
    shareDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_adlsdevvbsorce001_name_default 'Microsoft.Storage/storageAccounts/fileServices@2025-01-01' = {
  parent: storageAccounts_adlsdevvbsorce001_name_resource
  name: 'default'
  sku: {
    name: 'Standard_RAGRS'
    tier: 'Standard'
  }
  properties: {
    protocolSettings: {
      smb: {}
    }
    cors: {
      corsRules: []
    }
    shareDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_blobvbdevsnow_name_default 'Microsoft.Storage/storageAccounts/fileServices@2025-01-01' = {
  parent: storageAccounts_blobvbdevsnow_name_resource
  name: 'default'
  sku: {
    name: 'Standard_RAGRS'
    tier: 'Standard'
  }
  properties: {
    protocolSettings: {
      smb: {}
    }
    cors: {
      corsRules: []
    }
    shareDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource storageAccounts_adlsdevisionboardraw01an_name_sftp 'Microsoft.Storage/storageAccounts/localusers@2025-01-01' = {
  parent: storageAccounts_adlsdevisionboardraw01an_name_resource
  name: 'sftp'
  properties: {
    allowAclAuthorization: false
    hasSshPassword: true
    permissionScopes: [
      {
        permissions: 'rcwdlop'
        service: 'blob'
        resourceName: 'input'
      }
    ]
    homeDirectory: 'input'
    hasSharedKey: false
    hasSshKey: false
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_adlsdevisionboardraw01an_name_default 'Microsoft.Storage/storageAccounts/queueServices@2025-01-01' = {
  parent: storageAccounts_adlsdevisionboardraw01an_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_adlsdevvbsorce001_name_default 'Microsoft.Storage/storageAccounts/queueServices@2025-01-01' = {
  parent: storageAccounts_adlsdevvbsorce001_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_blobvbdevsnow_name_default 'Microsoft.Storage/storageAccounts/queueServices@2025-01-01' = {
  parent: storageAccounts_blobvbdevsnow_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_adlsdevisionboardraw01an_name_default 'Microsoft.Storage/storageAccounts/tableServices@2025-01-01' = {
  parent: storageAccounts_adlsdevisionboardraw01an_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_adlsdevvbsorce001_name_default 'Microsoft.Storage/storageAccounts/tableServices@2025-01-01' = {
  parent: storageAccounts_adlsdevvbsorce001_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_blobvbdevsnow_name_default 'Microsoft.Storage/storageAccounts/tableServices@2025-01-01' = {
  parent: storageAccounts_blobvbdevsnow_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev_Default 'Microsoft.Sql/servers/databases/advancedThreatProtectionSettings@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingPolicies_servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev
  name: 'Default'
  location: 'Central India'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev_Default 'Microsoft.Sql/servers/databases/auditingSettings@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev
  name: 'default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 12
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev
  name: 'Default'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev
  name: 'Current'
  properties: {}
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev
  name: 'Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev
  name: 'Current'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2024-05-01-preview' = {
  parent: servers_sql_srvr_vb_dev_anu_name_sql_db_vb_dev
  name: 'Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_sql_srvr_vb_dev_anu_name_resource
  ]
}

resource storageAccounts_adlsdevisionboardraw01an_name_default_input 'Microsoft.Storage/storageAccounts/blobServices/containers@2025-01-01' = {
  parent: storageAccounts_adlsdevisionboardraw01an_name_default
  name: 'input'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_adlsdevisionboardraw01an_name_resource
  ]
}

resource storageAccounts_adlsdevvbsorce001_name_default_input 'Microsoft.Storage/storageAccounts/blobServices/containers@2025-01-01' = {
  parent: storageAccounts_adlsdevvbsorce001_name_default
  name: 'input'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_adlsdevvbsorce001_name_resource
  ]
}

resource storageAccounts_blobvbdevsnow_name_default_input 'Microsoft.Storage/storageAccounts/blobServices/containers@2025-01-01' = {
  parent: storageAccounts_blobvbdevsnow_name_default
  name: 'input'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
  dependsOn: [
    storageAccounts_blobvbdevsnow_name_resource
  ]
}
