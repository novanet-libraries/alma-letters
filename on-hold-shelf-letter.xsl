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
        <!-- header.xsl -->
        <xsl:call-template name="senderReceiver"/>
        <!-- SenderReceiver.xsl -->
        <xsl:call-template name="toWhomIsConcerned"/>
        <!-- mailReason.xsl -->
        <div class="messageArea">
          <div class="messageBody">
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <xsl:text>@@following_item_requested_on@@ @@can_picked_at@@ </xsl:text>
                  <xsl:choose>
                    <xsl:when test="notification_data/request/calculated_destination_name != ''">
                      <xsl:value-of select="notification_data/request/calculated_destination_name"/>
                    </xsl:when>
                    <xsl:when test="notification_data/request/assigned_unit_name != ''">
                      <xsl:value-of select="notification_data/request/assigned_unit_name"/>
                    </xsl:when>
                    <xsl:otherwise>library</xsl:otherwise>
                  </xsl:choose>
                  <xsl:text>.</xsl:text>
                </td>
              </tr>
              <xsl:if test="notification_data/request/work_flow_entity/expiration_date">
                <tr>
                  <td>
							 @@note_item_held_until@@ <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/>.
							 </td>
                </tr>
              </xsl:if>
              <tr>
                <td>
                  <xsl:call-template name="recordTitle"/>
                  <!-- recordTitle.xsl -->
                </td>
              </tr>
              <xsl:if test="notification_data/request/system_notes">
                <tr>
                  <td>
                    <strong>@@notes_affect_loan@@:</strong>
                  </td>
                </tr>
                <tr>
                  <td>
                    <xsl:value-of select="notification_data/request/system_notes"/>
                  </td>
                </tr>
              </xsl:if>
            </table>
          </div>
        </div>
        <br/>
        <table role="presentation">
          <tr>
            <td>@@sincerely@@</td>
          </tr>
          <tr>
            <td><a href="https://www.novanet.ca/novanet-libraries-main-circulation-desk-contacts/">Contact Information for Novanet Libraries</a></td>
          </tr>
        </table>
        <xsl:call-template name="lastFooter"/>
        <xsl:call-template name="myAccount"/>
        <!-- footer.xsl -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
