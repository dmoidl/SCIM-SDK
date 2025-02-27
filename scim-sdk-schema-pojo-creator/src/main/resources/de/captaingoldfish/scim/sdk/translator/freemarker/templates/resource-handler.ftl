package ${packageName};

import java.util.List;
import java.util.ArrayList;

import de.captaingoldfish.scim.sdk.common.constants.enums.SortOrder;
import de.captaingoldfish.scim.sdk.common.schemas.SchemaAttribute;
import de.captaingoldfish.scim.sdk.server.endpoints.Context;
import de.captaingoldfish.scim.sdk.server.endpoints.ResourceHandler;
import de.captaingoldfish.scim.sdk.server.filter.FilterNode;
import de.captaingoldfish.scim.sdk.server.response.PartialListResponse;

import ${resourceImport};


/**
 *
 */
public class ${className} extends ResourceHandler<${resourceName}>
{

  /**
   * {@inheritDoc}
   */
  @Override
  public ${resourceName} createResource(${resourceName} resource, Context context)
  {
    // TODO
    return resource;
  }

  /**
   * {@inheritDoc}
   */
  <#assign leftPad=''?left_pad(resourceName?length + 22) />
  @Override
  public ${resourceName} getResource(String id,
                                     <#lt>${leftPad}List<${'SchemaAttribute'}> attributes,
                                     <#lt>${leftPad}List<${'SchemaAttribute'}> excludedAttributes,
                                     <#lt>${leftPad}Context context)
  {
    // TODO
    return null;
  }

  /**
   * {@inheritDoc}
   */
  <#assign leftPad=''?left_pad(resourceName?length + 45) />
  @Override
  public PartialListResponse<${resourceName}> listResources(long startIndex,
                                                            <#lt>${leftPad}int count,
                                                            <#lt>${leftPad}FilterNode filter,
                                                            <#lt>${leftPad}SchemaAttribute sortBy,
                                                            <#lt>${leftPad}SortOrder sortOrder,
                                                            <#lt>${leftPad}List<${'SchemaAttribute'}> attributes,
                                                            <#lt>${leftPad}List<${'SchemaAttribute'}> excludedAttributes,
                                                            <#lt>${leftPad}Context context)
  {
    // TODO
    return PartialListResponse.<${resourceName}> builder().resources(new ArrayList<>()).totalResults(0).build();
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public ${resourceName} updateResource(${resourceName} resource, Context context)
  {
    return resource;
  }

  /**
   * {@inheritDoc}
   */
  @Override
  public void deleteResource(String id, Context context)
  {
    // TODO
  }
}
