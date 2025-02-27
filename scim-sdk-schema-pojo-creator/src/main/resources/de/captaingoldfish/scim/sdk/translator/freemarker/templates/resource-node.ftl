<#import "makros.ftl" as makros>
<#import "functions.ftl" as functions>
package ${packageName};

import java.time.Instant;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

<#if !isExtension>
    <#lt>import de.captaingoldfish.scim.sdk.common.resources.ResourceNode;
</#if>
import de.captaingoldfish.scim.sdk.common.resources.base.ScimObjectNode;
import de.captaingoldfish.scim.sdk.common.resources.complex.Meta;
<#if lombok>
    <#lt>import lombok.Builder;
</#if>


<@makros.addJavadoc javadoc=resource.description.get() indent=0 />
public class ${resource.name.get()?cap_first?replace(" ", "")} extends <#rt>
<#lt><#if isExtension>
    <#lt>ScimObjectNode
<#else>
    <#lt>ResourceNode
</#if>
{

<@makros.addConstructor name=resource.name.get()?replace(" ", "")
                        attributesList=resource.attributes
                        isResourceNode=!isExtension
                        extensionList=extensionList
                        indent=2 />

<@makros.addGetterAndSetter attributeList=resource.attributes extensionList=extensionList indent=2 />

<#list resource.attributes as attribute>
    <@makros.addComplexTypeClasses attribute=attribute />
</#list>

  <@makros.addJavadoc javadoc='contains the attribute names of the resource representation' indent=2 />
  public static class FieldNames
  {

    <#assign fieldNames = [ "SCHEMA" ] />
    public static final String SCHEMA = "${resource.nonNullId}";

    <#list resource.attributes as attribute>
      <#if functions.doNotIgnoreAttribute(attribute)  >
        <#lt><#if !fieldNames?seq_contains(attribute.name?upper_case)>
          <#assign fieldNames = fieldNames + [ attribute.name?upper_case ] />
          <#lt>${''?left_pad(4)}public static final String ${attribute.name?upper_case} = "${attribute.name}";
          <#lt><#if attribute.type == 'COMPLEX'>
            <#list attribute.subAttributes as subAttribute>
              <#if !fieldNames?seq_contains(subAttribute.name?upper_case)>
                <#assign fieldNames = fieldNames + [ subAttribute.name?upper_case ] />

                <#lt>${''?left_pad(4)}public static final String ${subAttribute.name?upper_case} = "${subAttribute.name}";
              </#if>
            </#list>
          </#if>
        </#if>
      </#if>

    </#list>
    <#list extensionList as extension>
        <#lt>${''?left_pad(4)}public static final String ${extension.name.get()?upper_case} = "${extension.name.get()}";
    </#list>
  }
}
