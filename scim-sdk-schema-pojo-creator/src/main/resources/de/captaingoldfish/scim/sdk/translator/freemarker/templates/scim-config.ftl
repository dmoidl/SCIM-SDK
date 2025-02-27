package ${packageName};

import java.util.Collections;

import de.captaingoldfish.scim.sdk.common.resources.ServiceProvider;
import de.captaingoldfish.scim.sdk.common.resources.ServiceProvider;
import de.captaingoldfish.scim.sdk.common.resources.complex.BulkConfig;
import de.captaingoldfish.scim.sdk.common.resources.complex.ChangePasswordConfig;
import de.captaingoldfish.scim.sdk.common.resources.complex.ETagConfig;
import de.captaingoldfish.scim.sdk.common.resources.complex.FilterConfig;
import de.captaingoldfish.scim.sdk.common.resources.complex.PatchConfig;
import de.captaingoldfish.scim.sdk.common.resources.complex.SortConfig;
import de.captaingoldfish.scim.sdk.common.resources.multicomplex.AuthenticationScheme;
import de.captaingoldfish.scim.sdk.server.endpoints.ResourceHandler;
import de.captaingoldfish.scim.sdk.server.endpoints.ResourceEndpoint;
import de.captaingoldfish.scim.sdk.server.schemas.ResourceType;
import de.captaingoldfish.scim.sdk.server.schemas.custom.ResourceTypeFeatures;

<#list resourceImports as resourceImport>
    <#lt>import ${resourceImport};
</#list>
<#list resourceHandlerImports as resourceHandlerImport>
    <#lt>import ${resourceHandlerImport};
</#list>
<#list endpointDefinitionImports as endpointDefinitionImport>
    <#lt>import ${endpointDefinitionImport};
</#list>

<#if useLombok>
    <#lt>import lombok.Getter;
</#if>

<#if useLombok>
@Getter
</#if>
public class ScimConfig
{

  private final ResourceEndpoint resourceEndpoint;

  public ScimConfig()
  {
    ServiceProvider serviceProvider = getServiceProviderConfig();
    this.resourceEndpoint = new ResourceEndpoint(serviceProvider);
    configureResourceEndpoint(this.resourceEndpoint);
  }

  /**
   * create the service provider configuration
   */
  private ServiceProvider getServiceProviderConfig()
  {
    AuthenticationScheme authScheme = AuthenticationScheme.builder()
                                                          .name("Bearer")
                                                          .description("Authentication scheme using the OAuth "
                                                                       + "Bearer Token Standard")
                                                          .specUri("http://www.rfc-editor.org/info/rfc6750")
                                                          .type("oauthbearertoken")
                                                          .build();
    return ServiceProvider.builder()
                          .filterConfig(FilterConfig.builder().supported(true).maxResults(50).build())
                          .sortConfig(SortConfig.builder().supported(true).build())
                          .changePasswordConfig(ChangePasswordConfig.builder().supported(true).build())
                          .bulkConfig(BulkConfig.builder().supported(true).maxOperations(10).build())
                          .patchConfig(PatchConfig.builder().supported(true).build())
                          .authenticationSchemes(Collections.singletonList(authScheme))
                          .eTagConfig(ETagConfig.builder().supported(true).build())
                          .build();
  }

  private void configureResourceEndpoint(ResourceEndpoint resourceEndpoint)
  {
    <#list typeRelations as typeRelation>
    {
      ResourceHandler<${typeRelation.resourceNodeClassName}> resourceHandler = new ${typeRelation.resourceHandlerClassName}();
      ResourceType resourceType = resourceEndpoint.registerEndpoint(new ${typeRelation.resourceTypeClassName}(resourceHandler));
      resourceType.setFeatures(ResourceTypeFeatures.builder().autoFiltering(true).autoSorting(true).build());
    }
    </#list>
  }

<#if !useLombok>
  public ResourceEndpoint getResourceEndpoint()
  {
    return resourceEndpoint;
  }
</#if>

}
