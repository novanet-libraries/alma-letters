<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="header.xsl"/>
  <xsl:include href="senderReceiver.xsl"/>
  <xsl:include href="mailReason.xsl"/>
  <xsl:include href="footer.xsl"/>
  <xsl:include href="style.xsl"/>
  <xsl:include href="recordTitle.xsl"/>
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
        <xsl:call-template name="head"/>
        <!-- header.xsl -->
        <!-- <xsl:call-template name="senderReceiver" /> SenderReceiver.xsl -->
        <br/>
        <xsl:call-template name="toWhomIsConcerned"/>
        <!-- mailReason.xsl -->
        <div class="messageArea">
          <div class="messageBody">
            <table role='presentation' cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  @@bodyTextBeforeLink@@
                  <a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="notification_data/reset_pw_url"/>
                    </xsl:attribute>
                    @@linkLabel@@
                  </a>
                </td>
              </tr>
              <tr>
                <td>
                  @@bodyTextAfterLink@@
                  <xsl:choose>
                    <xsl:when test="contains(notification_data/reset_pw_url, 'backUrl=')">one hour.</xsl:when>
                    <xsl:otherwise>one week.</xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
            </table>
            <table role="presentation">
              <tr>
                <td>@@signature@@</td>
              </tr>
              <tr>
                <td>
                  <a href="https://www.novanet.ca/novanet-libraries-main-circulation-desk-contacts/">Contact Information for Novanet Libraries</a>
                </td>
              </tr>
            </table>
          </div>
        </div>
        <xsl:call-template name="lastFooter"/>
        <!-- link to "My Account" isn't helpful in a reset password letter -->
        <!-- footer.xsl -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
