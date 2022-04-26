<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="head">
    <xsl:param name="letterName" select=""/>
    <table cellspacing="0" cellpadding="5" border="0">
      <xsl:attribute name="style">
        <xsl:call-template name="headerTableStyleCss"/>
        <!-- style.xsl -->
      </xsl:attribute>
      <!-- LOGO INSERT -->
      <tr>
        <xsl:attribute name="style">
          <xsl:call-template name="headerLogoStyleCss"/>
          <!-- style.xsl -->
        </xsl:attribute>
        <td colspan="2">
          <div id="mailHeader">
            <div id="logoContainer" class="alignLeft">
              <img src="cid:logo.jpg" alt="logo"/>
            </div>
          </div>
        </td>
      </tr>
      <!-- END OF LOGO INSERT -->
      <tr>
        <xsl:for-each select="notification_data/general_data">
          <td>
            <xsl:choose>
              <xsl:when test="$letterName">
                <h1>
                  <xsl:value-of select="$letterName"/>
                </h1>
              </xsl:when>
              <xsl:otherwise>
                <h1>
                  <xsl:value-of select="letter_name"/>
                </h1>
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </xsl:for-each>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>
