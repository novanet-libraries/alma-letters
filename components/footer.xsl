<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- de-activate / empty a built-in template -->
  <xsl:template name="salutation"/>

  <!-- bottom bar that identifies the library -->
  <xsl:template name="lastFooter">
    <table>
      <xsl:attribute name="style">
        <xsl:call-template name="footerTableStyleCss"/>
      </xsl:attribute>
      <tr>
        <xsl:attribute name="style">
          <xsl:call-template name="listStyleCss"/>
        </xsl:attribute>
        <td align="left">
          <xsl:choose>
            <!-- when the letter is an institution-level letter at Dal, check if the institution might be King's and just explicitly say that -->
            <xsl:when test="notification_data/organization_unit/org_scope/institution_id = '7190' and not(notification_data/organization_unit/org_scope/library_id/node())">
              <xsl:choose>
                <xsl:when test="notification_data/library/code = 'KINGS'">
                  <xsl:value-of select="notification_data/library/name"/>
                </xsl:when>
                <xsl:when test="substring-after(notification_data/general_data/address_from, '@') = 'ukings.ca'">
                  <xsl:text>University of King's College</xsl:text>
                </xsl:when> 
                <xsl:when test="substring-after(notification_data/letter_params/address_from, '@') = 'ukings.ca'">
                  <xsl:text>University of King's College</xsl:text>
                </xsl:when> 
                <xsl:when test="notification_data/receivers/receiver/printer/library_id = '112098730007190'">
                  <xsl:text>University of King's College</xsl:text>
                </xsl:when>
                <xsl:when test="notification_data/incoming_request/library_id = '112098730007190'">
                  <xsl:text>University of King's College</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <!-- could not find "KINGS" anywhere; fallback to "Dalhousie University" -->
                  <xsl:value-of select="notification_data/organization_unit/name"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <!-- otherwise just write the regular org_unit name (institution or library) -->
            <xsl:otherwise>
              <xsl:value-of select="notification_data/organization_unit/name"/>
            </xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
    </table>
  </xsl:template>

  <!-- de-activate / empty a built-in template -->
  <xsl:template name="contactUs"/>

  <xsl:template name="myAccount">
    <table align="left" style="margin-top:1em;">
      <tr>
        <td align="left">
          <a>
            <xsl:attribute name="style">
              <xsl:call-template name="myAccountStyleCss"/>
            </xsl:attribute>
            <xsl:attribute name="href">
              <xsl:choose>
                <xsl:when test="/notification_data/receivers/receiver/user/campus_code = 'KINGS'">https://kings.novanet.ca/discovery/account?vid=01NOVA_DAL:KINGS</xsl:when>
                <xsl:when test="/notification_data/receivers/receiver/user/external_id = '01NOVA_ACAD'">https://acadia.novanet.ca/discovery/account?vid=01NOVA_ACAD:ACAD</xsl:when>
                <xsl:when test="/notification_data/receivers/receiver/user/external_id = '01NOVA_AST'">https://ast.novanet.ca/discovery/account?vid=01NOVA_AST:AST</xsl:when>
                <xsl:when test="/notification_data/receivers/receiver/user/external_id = '01NOVA_CBU'">https://cbu.novanet.ca/discovery/account?vid=01NOVA_CBU:CBU</xsl:when>
                <xsl:when test="/notification_data/receivers/receiver/user/external_id = '01NOVA_DAL'">https://dal.novanet.ca/discovery/account?vid=01NOVA_DAL:DAL</xsl:when>
                <xsl:when test="/notification_data/receivers/receiver/user/external_id = '01NOVA_NSCAD'">https://nscad.novanet.ca/discovery/account?vid=01NOVA_NSCAD:NSCAD</xsl:when>
                <xsl:when test="/notification_data/receivers/receiver/user/external_id = '01NOVA_NSCC'">https://nscc.novanet.ca/discovery/account?vid=01NOVA_NSCC:NSCC</xsl:when>
                <xsl:when test="/notification_data/receivers/receiver/user/external_id = '01NOVA_MTA'">https://mta.novanet.ca/discovery/account?vid=01NOVA_MTA:MTA</xsl:when>
                <xsl:when test="/notification_data/receivers/receiver/user/external_id = '01NOVA_MSVU'">https://msvu.novanet.ca/discovery/account?vid=01NOVA_MSVU:MSVU</xsl:when>
                <xsl:when test="/notification_data/receivers/receiver/user/external_id = '01NOVA_STFX'">https://stfx.novanet.ca/discovery/account?vid=01NOVA_STFX:STFX</xsl:when>
                <xsl:when test="/notification_data/receivers/receiver/user/external_id = '01NOVA_SMU'">https://smu.novanet.ca/discovery/account?vid=01NOVA_SMU:SMU</xsl:when>
                <xsl:when test="/notification_data/receivers/receiver/user/external_id = '01NOVA_USA'">https://usainteanne.novanet.ca/discovery/account?vid=01NOVA_USA:USA</xsl:when>
                <xsl:otherwise>@@email_my_account@@</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            @@my_account@@
          </a>
        </td>
      </tr>
    </table>
  </xsl:template>

  <!-- library-specific info for non-patron facing letters (e.g. slips) -->
  <xsl:template name="slipFooter">
    <xsl:if test="notification_data/general_data/letter_type">
      <div>
        <xsl:value-of select="notification_data/general_data/letter_type"/>
      </div>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
