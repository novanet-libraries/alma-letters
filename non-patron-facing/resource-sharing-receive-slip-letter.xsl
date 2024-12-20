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
        <title>
          <xsl:value-of select="notification_data/general_data/subject"/>
        </title>
        <xsl:call-template name="generalStyle"/>
      </head>
      <body>
        <xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss"/>
          <!-- style.xsl -->
        </xsl:attribute>
        <xsl:call-template name="head"/>
        <div class="messageArea">
          <div class="messageBody">
            <table role='presentation' cellspacing="0" cellpadding="5" border="0">
              <xsl:attribute name="style">
                <xsl:call-template name="listStyleCss"/>
                <!-- style.xsl -->
              </xsl:attribute>
              <tr>
                <td>
                  <br/>
                  <strong> @@title@@: </strong>
                  <xsl:value-of select="notification_data/request/display/normalized_title"/>
                </td>
              </tr>
              <tr>
                <td>
                  <strong> @@author@@: </strong>
                  <xsl:value-of select="notification_data/request/display/author"/>
                </td>
              </tr>
              <tr>
                <td>
                  <br/>
                  <strong> @@patron_name@@: </strong>
                  <xsl:value-of select="notification_data/patron_name"/>
                  <xsl:text> ( </xsl:text>
                  <xsl:value-of select="notification_data/patron_username"/>
                  <xsl:text> ) </xsl:text>
                </td>
              </tr>
              <tr>
                <td>
                  <br/>
                  <strong>@@request_id@@: </strong>
                  <img src="externalId.png" alt="externalId"/>
                </td>
              </tr>
              <xsl:if test="notification_data/barcode !=''">
                <tr>
                  <td>
                    <br/>
                    <strong>@@item_barcode@@: </strong>
                    <img src="Barcode.png" alt="Barcode"/>
                  </td>
                </tr>
              </xsl:if>
              <tr>
                <td>
                  <br/>
                  <strong> @@request_date@@: </strong>
                  <xsl:value-of select="notification_data/request/create_date_str"/>
                </td>
              </tr>
              <tr>
                <td>
                  <strong> @@arrival_date@@: </strong>
                  <xsl:value-of select="notification_data/request/item_arrival_date"/>
                </td>
              </tr>
              <tr>
                <td>
                  <br/>
                  <strong> @@pickup_location@@: </strong>
                  <xsl:value-of select="notification_data/request/pickup_location_str"/>
                </td>
              </tr>
              <tr>
                <td>
                  <strong> Preferred Pickup Location: </strong>
                  <xsl:value-of select="notification_data/request/preferred_pickup_institution"/>
                  <xsl:text> / </xsl:text>
                  <xsl:value-of select="notification_data/request/preferred_pickup_location"/>
                  <xsl:text> / </xsl:text>
                  <xsl:value-of select="notification_data/request/preferred_pickup_location_str"/>
                </td>
              </tr>
              <tr>
                <td>
                  <strong> @@circulation_note@@: </strong>
                  <xsl:value-of select="notification_data/circulation_note"/>
                </td>
              </tr>
              <tr>
                <td>
                  <strong> @@shipping_cost@@: </strong>
                  <xsl:value-of select="notification_data/request/shipping_cost/normalized_sum"/>&#160;<xsl:value-of select="notification_data/request/shipping_cost/currency"/>
                </td>
              </tr>
              <xsl:if test="notification_data/citation_id !=''">
                <tr>
                  <td>
                    <br/>
                    <strong> @@reading_list@@: </strong>
                    <xsl:value-of select="notification_data/reading_list_name"/> (<xsl:value-of select="notification_data/reading_list_code"/>)
                </td>
                </tr>
                <tr>
                  <td>
                    <strong> @@citation_id@@: </strong>
                    <xsl:value-of select="notification_data/citation_id"/>
                  </td>
                </tr>
              </xsl:if>
            </table>
          </div>
        </div>
        <xsl:call-template name="lastFooter"/>
        <xsl:call-template name="slipFooter"/>
        <!-- footer.xsl -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
