package de.captaingoldfish.scim.sdk.common.resources.complex;

import java.util.Optional;

import de.captaingoldfish.scim.sdk.common.constants.AttributeNames;
import de.captaingoldfish.scim.sdk.common.resources.base.ScimObjectNode;
import lombok.Builder;
import lombok.NoArgsConstructor;


/**
 * author Pascal Knueppel <br>
 * created at: 18.10.2019 - 11:12 <br>
 * <br>
 * A complex type that specifies PATCH configuration options. REQUIRED. See Section 3.5.2 of [RFC7644].
 */
@NoArgsConstructor
public class PatchConfig extends ScimObjectNode
{

  @Builder
  public PatchConfig(Boolean supported, Boolean activateSailsPointWorkaround)
  {
    super(null);
    setSupported(supported);
    setActivateSailsPointWorkaround(activateSailsPointWorkaround);
  }

  /**
   * A Boolean value specifying whether the operation is supported. REQUIRED.
   */
  public boolean isSupported()
  {
    return getBooleanAttribute(AttributeNames.RFC7643.SUPPORTED).orElse(false);
  }

  /**
   * A Boolean value specifying whether the operation is supported. REQUIRED.
   */
  public void setSupported(Boolean supported)
  {
    setAttribute(AttributeNames.RFC7643.SUPPORTED, Optional.ofNullable(supported).orElse(false));
  }

  /**
   * A Workaround to handle patch replace-ops on single complex types as add operations.
   *
   * @see https://github.com/Captain-P-Goldfish/SCIM-SDK/issues/327
   */
  public boolean isActivateSailsPointWorkaround()
  {
    return getBooleanAttribute(AttributeNames.Custom.ACTIVATE_SAILS_POINT_WORKAROUND).orElse(false);
  }

  /**
   * A Workaround to handle patch replace-ops on single complex types as add operations.
   *
   * @see https://github.com/Captain-P-Goldfish/SCIM-SDK/issues/327
   */
  public void setActivateSailsPointWorkaround(Boolean activateSailsPointWorkaround)
  {
    setAttribute(AttributeNames.Custom.ACTIVATE_SAILS_POINT_WORKAROUND,
                 Optional.ofNullable(activateSailsPointWorkaround).orElse(false));
  }

  /**
   * override lombok builder with public constructor
   */
  public static class PatchConfigBuilder
  {

    public PatchConfigBuilder()
    {}
  }
}
