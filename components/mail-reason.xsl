<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="toWhomIsConcerned">
<table cellspacing="0" cellpadding="5" border="0">
  <tr>
    <td>
      <xsl:for-each select="notification_data">
        <p style="display:block; font-size:1.17em; margin-left:0; margin-right:0;">
          <xsl:text>@@dear@@&#160;</xsl:text>
          <xsl:choose>
            <xsl:when test="receivers/receiver/user/preferred_first_name">
              <xsl:value-of select="receivers/receiver/user/preferred_first_name"/>
            </xsl:when>
            <xsl:when test="receivers/receiver/user/first_name">
              <xsl:value-of select="receivers/receiver/user/first_name"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="receivers/receiver/user/full_name"/>
            </xsl:otherwise>
          </xsl:choose>
        </p>
      </xsl:for-each>
    </td>
  </tr>
</table>
</xsl:template>

</xsl:stylesheet>
