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
        <!--
        <xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss"/>
        </xsl:attribute>
        -->
        <xsl:attribute name="style">margin:0;padding:0;color:#333;font-family:arial,sans-serif;font-size:120%</xsl:attribute>        
        <xsl:call-template name="head"/>
        <!-- header.xsl -->
        <div class="messageArea">
          <div class="messageBody">
            <table cellspacing="0" cellpadding="0" border="0">
              <tr>
                <td>
                  <b>@@supplied_to@@: </b>
                  <xsl:value-of select="notification_data/partner_name"/>
                </td>
              </tr>
              <tr>
                <td>
                  <p><b>@@shipping_address@@: </b></p>
                </td>
              </tr>
              <tr>
                <td>
                  <table cellspacing="0" cellpadding="0" border="0">
                    <xsl:attribute name="style">
                      <xsl:call-template name="listStyleCss"/>
                    </xsl:attribute>
                    <xsl:call-template name="print-row-if-data-exists">
                      <xsl:with-param name="data" select="notification_data/incoming_request/borrowing_institution"/>
                    </xsl:call-template>
                    <xsl:call-template name="print-row-if-data-exists">
                      <xsl:with-param name="data" select="notification_data/incoming_request/borrowing_library"/>
                    </xsl:call-template>
                    <xsl:call-template name="print-row-if-data-exists">
                      <xsl:with-param name="data" select="notification_data/partner_shipping_info_list/partner_shipping_info/address1"/>
                    </xsl:call-template>
                    <xsl:call-template name="print-row-if-data-exists">
                      <xsl:with-param name="data" select="notification_data/partner_shipping_info_list/partner_shipping_info/address2"/>
                    </xsl:call-template>
                    <xsl:call-template name="print-row-if-data-exists">
                      <xsl:with-param name="data" select="notification_data/partner_shipping_info_list/partner_shipping_info/address3"/>
                    </xsl:call-template>
                    <xsl:call-template name="print-row-if-data-exists">
                      <xsl:with-param name="data" select="notification_data/partner_shipping_info_list/partner_shipping_info/address4"/>
                    </xsl:call-template>
                    <xsl:call-template name="print-row-if-data-exists">
                      <xsl:with-param name="data" select="notification_data/partner_shipping_info_list/partner_shipping_info/address5"/>
                    </xsl:call-template>
                    <tr>
                      <td>
                        <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/city"/>
                        <xsl:text>&#160;</xsl:text>
                        <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/postal_code"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/state"/>
                        <xsl:text>&#160;</xsl:text>
                        <xsl:value-of select="notification_data/partner_shipping_info_list/partner_shipping_info/country"/>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td>
                  <!-- line spacer -->
                  &#160;
                </td>
              </tr>
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
              <tr>
                <td>
                  <!-- line spacer -->
                  &#160;
                </td>
              </tr>
              <xsl:if test="notification_data/incoming_request/create_date">
                <tr>
                  <td>
                    <b>Request Date: </b>
                    <xsl:value-of select="notification_data/incoming_request/create_date"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/incoming_request/create_date">
                <tr>
                  <td>
                    <b>Print Date: </b>
                    <xsl:value-of select="notification_data/general_data/current_date"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:call-template name="print-row-if-data-exists">
                <xsl:with-param name="label">Due Date</xsl:with-param>
                <xsl:with-param name="data" select="notification_data/incoming_request/due_date_str"/>
              </xsl:call-template>
              <xsl:if test="notification_data/incoming_request/needed_by">
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
              <xsl:if test="notification_data/incoming_request/external_request_id">
                <tr>
                  <td>
                    <b>@@external_identifier@@: </b>
                    <xsl:call-template name="scannable-barcode">
                      <xsl:with-param name="barcode" select="notification_data/incoming_request/external_request_id"/>
                      <xsl:with-param name="imgname">cid:externalId.png</xsl:with-param>
                    </xsl:call-template>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/item">
                <tr>
                  <td>
                    <b>@@item_barcode@@: </b>
                    <xsl:call-template name="scannable-barcode">
                      <xsl:with-param name="barcode" select="notification_data/item/barcode"/>
                      <xsl:with-param name="imgname">cid:Barcode1.png</xsl:with-param>
                    </xsl:call-template>
                  </td>
                </tr>
              </xsl:if>
              <tr>
                <td>
                  <b>@@title@@: </b>
                  <xsl:value-of select="notification_data/metadata/title"/>
                                  &#160;
                                <br/><b>@@author@@: </b>
                  <xsl:value-of select="notification_data/metadata/author"/>
                                  &#160;
             	                <br/><b>@@volume@@: </b>
                  <xsl:value-of select="notification_data/metadata/volume"/>
			                      &#160;
			                    <br/><b>@@issue@@: </b>
                  <xsl:value-of select="notification_data/metadata/issue"/>
                </td>
              </tr>
            </table>
          </div>
        </div>
        <xsl:call-template name="lastFooter"/>
<!--        <xsl:call-template name="slipFooter"/> -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>