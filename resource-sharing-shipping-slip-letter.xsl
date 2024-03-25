<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:variable name="counter" select="0"/>
  <xsl:include href="header.xsl"/>
  <xsl:include href="senderReceiver.xsl"/>
  <xsl:include href="mailReason.xsl"/>
  <xsl:include href="footer.xsl"/>
  <xsl:include href="style.xsl"/>
  <xsl:include href="recordTitle.xsl"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="generalStyle"/>
      </head>
      <body>
        <xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss"/>
          <!-- style.xsl -->
        </xsl:attribute>
        <xsl:call-template name="head"/>
        <!-- header.xsl -->
        <div class="messageArea">
          <div class="messageBody">
            <table cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <b>@@supplied_to@@: </b>
                  <xsl:value-of select="notification_data/partner_name"/>
                </td>
              </tr>
              <tr>
                <td>
                  <b>@@shipping_address@@: </b>
                </td>
              </tr>
              <xsl:if test="notification_data/incoming_request/borrowing_institution!=''">
                <tr>
                  <td>
                    <xsl:value-of select="notification_data/incoming_request/borrowing_institution"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/incoming_request/borrowing_library!=''">
                <tr>
                  <td>
                    <xsl:value-of select="notification_data/incoming_request/borrowing_library"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:for-each select="notification_data/partner_shipping_info_list/partner_shipping_info">
                <br/>
                <table cellspacing="0" cellpadding="5" border="0">
                  <xsl:attribute name="style">
                    <xsl:call-template name="listStyleCss"/>
                    <!-- style.xsl -->
                  </xsl:attribute>
                  <tr>
                    <td>
                      <xsl:value-of select="address1"/>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <xsl:value-of select="address2"/>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <xsl:value-of select="address4"/>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <xsl:value-of select="address5"/>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <xsl:value-of select="city"/>&#160;<xsl:value-of select="postal_code"/>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <xsl:value-of select="state"/>&#160;<xsl:value-of select="country"/>
                    </td>
                  </tr>
                </table>
              </xsl:for-each>
              <tr>
                <td>
                  <b>@@email@@: </b>
                  <xsl:value-of select="notification_data/email"/>
                </td>
              </tr>
              <tr>
                <td>
                  <b>@@phone@@: </b>
                  <xsl:value-of select="notification_data/phone"/>
                </td>
              </tr>
              <xsl:if test="notification_data/incoming_request/needed_by_dummy/full_date">
                <tr>
                  <td>
                    <b>@@date_needed_by@@: </b>
                    <xsl:value-of select="notification_data/incoming_request/needed_by"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/incoming_request/note">
                <tr>
                  <td>
                    <b>@@request_note@@: </b>
                    <xsl:value-of select="notification_data/incoming_request/note"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/item">
                <tr>
                  <td>
                    <b>@@item_barcode@@: </b>
                     <xsl:call-template name="scannable-barcode">
                      <xsl:with-param name="barcode" select="notification_data/item/barcode"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </xsl:if>
              <tr>
                <td>
                  <b>@@title@@: </b>
                  <xsl:value-of select="notification_data/metadata/title"/>
                                  &#160;
                                <b>@@author@@: </b>
                  <xsl:value-of select="notification_data/metadata/author"/>
                                  &#160;
             	                <b>@@volume@@: </b>
                  <xsl:value-of select="notification_data/metadata/volume"/>
			                      &#160;
			                    <b>@@issue@@: </b>
                  <xsl:value-of select="notification_data/metadata/issue"/>
                </td>
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