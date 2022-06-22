<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:urls="http://novanet.ca/memberurls">
  <xsl:template name="salutation"/>
  <xsl:template name="lastFooter">
    <table>
      <xsl:attribute name="style">
        <xsl:call-template name="footerTableStyleCss"/>
        <!-- style.xsl -->
      </xsl:attribute>
      <tr>
        <xsl:for-each select="notification_data/organization_unit">
          <xsl:attribute name="style">
            <xsl:call-template name="listStyleCss"/>
            <!-- style.xsl -->
          </xsl:attribute>
          <td align="left">
            <xsl:value-of select="name"/>
          </td>
        </xsl:for-each>
      </tr>
    </table>
  </xsl:template>
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
              @@email_my_account@@
            </xsl:attribute>
						@@my_account@@
					</a>
        </td>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>
