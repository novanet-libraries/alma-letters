<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="header.xsl"/>
  <xsl:include href="senderReceiver.xsl"/>
  <xsl:include href="mailReason.xsl"/>
  <xsl:include href="footer.xsl"/>
  <xsl:include href="style.xsl"/>
  <xsl:template match="/">
    <html>
      <xsl:if test="notification_data/languages/string">
        <xsl:attribute name="lang">
          <xsl:value-of select="notification_data/languages/string"/>
        </xsl:attribute>
      </xsl:if>
      <head>
        <title>
          <xsl:value-of select="notification_data/general_data/subject"/>
        </title>
        <xsl:call-template name="generalStyle"/>
      </head>
      <body>
        <xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss"/>
        </xsl:attribute>
        <xsl:call-template name="head"/>
        <xsl:call-template name="senderReceiver"/>
        <br/>
        <xsl:call-template name="toWhomIsConcerned"/>
        <xsl:text>@@You_were_specify@@</xsl:text>
        <br/>
        <table role='presentation' cellspacing="0" cellpadding="5" border="0">
          <xsl:if test="normalize-space(notification_data/line_number) != ''">
            <tr>
              <td>@@orderNumber@@</td>
              <td>
                <xsl:value-of select="notification_data/line_number"/>
              </td>
            </tr>
          </xsl:if>
          <xsl:if test="notification_data/title">
            <tr>
              <td>@@title@@</td>
              <td>
                <xsl:value-of select="notification_data/title"/>
              </td>
            </tr>
          </xsl:if>
          <xsl:if test="notification_data/mms_id">
            <tr>
              <td>@@mmsId@@</td>
              <td>
                <xsl:value-of select="notification_data/mms_id"/>
              </td>
            </tr>
          </xsl:if>
          <xsl:if test="normalize-space(notification_data/poline_inventory/call_number) != ''">
            <tr>
              <td>@@callNumber@@</td>
              <td>
                <xsl:value-of select="notification_data/poline_inventory/call_number"/>
              </td>
            </tr>
          </xsl:if>
          <xsl:if test="normalize-space(notification_data/receiving_note) != ''">
            <tr>
              <td>@@receivingNote@@</td>
              <td>
                <xsl:value-of select="notification_data/receiving_note"/>
              </td>
            </tr>
          </xsl:if>
          <xsl:if test="normalize-space(notification_data/message) != ''">
            <tr>
              <td>@@message@@</td>
              <td>
                <xsl:value-of select="notification_data/message"/>
              </td>
            </tr>
          </xsl:if>
        </table>
        <br/>
        <table role='presentation'>
          <tr>
            <td>@@sincerely@@</td>
          </tr>
          <tr>
            <td>@@department@@</td>
          </tr>
        </table>
        <xsl:call-template name="lastFooter"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>