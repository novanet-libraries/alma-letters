<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
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
        <xsl:call-template name="generalStyle"/>
      </head>
      <body>
        <xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss"/>
          <!-- style.xsl -->
        </xsl:attribute>
        <xsl:call-template name="head"/>
        <div class="messageArea">
          <table>
            <xsl:call-template name="print-row-if-data-exists">
              <xsl:with-param name="data" select="notification_data/partner_name_and_inst"/>
            </xsl:call-template>
            <xsl:call-template name="print-row-if-data-exists">
              <xsl:with-param name="data" select="notification_data/rapid_partner_address"/>
            </xsl:call-template>
            <xsl:call-template name="print-row-if-data-exists">
              <xsl:with-param name="data" select="notification_data/partner_address/line1"/>
            </xsl:call-template>
            <xsl:call-template name="print-row-if-data-exists">
              <xsl:with-param name="data" select="notification_data/partner_address/line2"/>
            </xsl:call-template>
            <xsl:call-template name="print-row-if-data-exists">
              <xsl:with-param name="data" select="notification_data/partner_address/line3"/>
            </xsl:call-template>
            <xsl:call-template name="print-row-if-data-exists">
              <xsl:with-param name="data" select="notification_data/partner_address/line4"/>
            </xsl:call-template>
            <xsl:call-template name="print-row-if-data-exists">
              <xsl:with-param name="data" select="notification_data/partner_address/line5"/>
            </xsl:call-template>
            <xsl:call-template name="print-row-if-data-exists">
              <xsl:with-param name="data" select="concat(notification_data/partner_address/city, ' ', notification_data/partner_address/state_province, ' ', notification_data/partner_address/postal_code)"/>
            </xsl:call-template>
          </table>
          <br/>
          <xsl:if test="'' != normalize-space(notification_data/borrowing/external_request_id)">
            <table>
              <xsl:call-template name="print-row-if-data-exists">
                <xsl:with-param name="data" select="notification_data/borrowing/external_request_id"/>
                <xsl:with-param name="label" select="'Regarding request ID'"/>
              </xsl:call-template>
              <xsl:call-template name="print-row-if-data-exists">
                <xsl:with-param name="data" select="notification_data/borrowing/title"/>
                <xsl:with-param name="label" select="'Title'"/>
              </xsl:call-template>
              <xsl:call-template name="print-row-if-data-exists">
                <xsl:with-param name="data" select="notification_data/borrowing/identifier"/>
                <xsl:with-param name="label" select="'ISBN/ISSN'"/>
              </xsl:call-template>
            </table>
          </xsl:if>
          <xsl:if test="'' != normalize-space(notification_data/lending/external_request_id)">
            <table>
              <xsl:call-template name="print-row-if-data-exists">
                <xsl:with-param name="data" select="notification_data/lending/external_request_id"/>
                <xsl:with-param name="label" select="'Regarding request ID'"/>
              </xsl:call-template>
              <xsl:call-template name="print-row-if-data-exists">
                <xsl:with-param name="data" select="notification_data/lending/title"/>
                <xsl:with-param name="label" select="'Title'"/>
              </xsl:call-template>
              <xsl:call-template name="print-row-if-data-exists">
                <xsl:with-param name="data" select="notification_data/lending/identifier"/>
                <xsl:with-param name="label" select="'ISBN/ISSN'"/>
              </xsl:call-template>
            </table>
          </xsl:if>
          <div class="messageBody">
            <table role='presentation' cellspacing="0" cellpadding="5" border="0">
              <xsl:attribute name="style">
                <xsl:call-template name="listStyleCss"/>
                <!-- style.xsl -->
              </xsl:attribute>
              <tr>
                <td>
                  <br/>
                  <xsl:value-of select="notification_data/subject"/>
                </td>
              </tr>
              <xsl:if test="notification_data/body !=''">
                <tr>
                  <td>
                    <br/>
                    <xsl:value-of select="notification_data/body" disable-output-escaping="yes"/>
                  </td>
                </tr>
              </xsl:if>
            </table>
            <br/>
            <br/>
            <table role='presentation'>
              <tr>
                <td>@@signature@@</td>
              </tr>
              <tr>
                <td>@@department@@</td>
              </tr>
            </table>
          </div>
        </div>
        <xsl:call-template name="lastFooter"/>
        <!-- footer.xsl -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
