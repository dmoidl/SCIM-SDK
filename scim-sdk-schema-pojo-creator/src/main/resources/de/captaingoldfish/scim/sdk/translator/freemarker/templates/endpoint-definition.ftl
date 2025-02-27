package ${packageName};

import java.util.Arrays;

import de.captaingoldfish.scim.sdk.common.utils.JsonHelper;
import de.captaingoldfish.scim.sdk.server.endpoints.EndpointDefinition;
import de.captaingoldfish.scim.sdk.server.endpoints.ResourceHandler;

import ${resourceImport};

public class ${resourceTypeName} extends EndpointDefinition
{

  public ${resourceTypeName}(ResourceHandler<${resourceName}> resourceHandler)
  {
    super(JsonHelper.loadJsonDocument("${resourceTypeClasspath?replace("\\", "/")}"),
          JsonHelper.loadJsonDocument("${resourceTypeSchemaClasspath?replace("\\", "/")}"),
          Arrays.asList(<#list extensionPaths as extensionPath><#rt>
             <#lt>JsonHelper.loadJsonDocument("${extensionPath?replace("\\", "/")}")
          </#list>), resourceHandler);
  }
}
