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
                  <b>@@borrower_reference@@: </b>
                  <xsl:value-of select="notification_data/incoming_request/external_request_id"/>
                </td>
              </tr>
              <tr>
                <td>
                  <b>@@my_id@@: </b>
                  <img src="externalId.png" alt="externalId"/>
                </td>
              </tr>
              <tr>
                <td>
                  <b>@@format@@: </b>
                  <xsl:value-of select="notification_data/incoming_request/format"/>
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
              <xsl:if test="notification_data/incoming_request/requester_email">
                <tr>
                  <td>
                    <b>@@requester_email@@: </b>
                    <xsl:value-of select="notification_data/incoming_request/requester_email"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/assignee != ''">
                <tr>
                  <td>
                    <b>@@assignee@@: </b>
                    <xsl:value-of select="notification_data/assignee"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="notification_data/level_of_service !=''">
                <tr>
                  <td>
                    <b>@@level_of_service@@: </b>
                    <xsl:value-of select="notification_data/level_of_service"/>
                  </td>
                </tr>
              </xsl:if>
            </table>
            <p>
              <strong>Bibliographic Data:</strong>
            </p>
            <table cellspacing="0" cellpadding="2" border="0">
              <xsl:call-template name="print-row-if-data-exists">
                <xsl:with-param name="label">@@author@@</xsl:with-param>
                <xsl:with-param name="data" select="notification_data/metadata/author"/>
              </xsl:call-template>
              <xsl:call-template name="print-row-if-data-exists">
                <xsl:with-param name="label">@@title@@</xsl:with-param>
                <xsl:with-param name="data" select="notification_data/metadata/title"/>
              </xsl:call-template>
              <xsl:call-template name="print-row-if-data-exists">
                <xsl:with-param name="label">@@journal_title@@</xsl:with-param>
                <xsl:with-param name="data" select="notification_data/metadata/journal_title"/>
              </xsl:call-template>
              <xsl:call-template name="print-row-if-data-exists">
                <xsl:with-param name="label">@@chapter_title@@</xsl:with-param>
                <xsl:with-param name="data" select="notification_data/metadata/chapter_title"/>
              </xsl:call-template>
              <xsl:call-template name="print-row-if-data-exists">
                <xsl:with-param name="label">@@isbn@@</xsl:with-param>
                <xsl:with-param name="data" select="notification_data/metadata/isbn"/>
              </xsl:call-template>
              <xsl:call-template name="print-row-if-data-exists">
                <xsl:with-param name="label">@@issn@@</xsl:with-param>
                <xsl:with-param name="data" select="notification_data/metadata/issn"/>
              </xsl:call-template>
              <xsl:call-template name="print-row-if-data-exists">
                <xsl:with-param name="label">@@publication_date@@</xsl:with-param>
                <xsl:with-param name="data" select="notification_data/metadata/publication_date"/>
              </xsl:call-template>
              <xsl:call-template name="print-row-if-data-exists">
                <xsl:with-param name="label">@@volume@@</xsl:with-param>
                <xsl:with-param name="data" select="notification_data/metadata/volume"/>
              </xsl:call-template>
              <xsl:call-template name="print-row-if-data-exists">
                <xsl:with-param name="label">@@issue@@</xsl:with-param>
                <xsl:with-param name="data" select="notification_data/metadata/issue"/>
              </xsl:call-template>
              <xsl:call-template name="print-row-if-data-exists">
                <xsl:with-param name="label">@@pages@@</xsl:with-param>
                <xsl:with-param name="data" select="notification_data/metadata/pages"/>
              </xsl:call-template>
              <xsl:call-template name="print-row-if-data-exists">
                <xsl:with-param name="label">@@call_number@@</xsl:with-param>
                <xsl:with-param name="data" select="notification_data/metadata/call_number"/>
              </xsl:call-template>
              <xsl:call-template name="print-row-if-data-exists">
                <xsl:with-param name="label">@@barcode@@</xsl:with-param>
                <xsl:with-param name="data" select="notification_data/metadata/barcode"/>
              </xsl:call-template>
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
