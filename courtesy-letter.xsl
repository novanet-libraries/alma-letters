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
        <xsl:call-template name="toWhomIsConcerned"/>
        <!-- mailReason.xsl -->
        <div class="messageArea">
          <div class="messageBody">
            <table role="presentation" cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <xsl:choose>
                    <xsl:when test="/notification_data/short_loans='true'">
                      @@short_loans_message@@
                    </xsl:when>
                    <xsl:otherwise>
                      @@message@@
                    </xsl:otherwise>
                  </xsl:choose>
                  <br/>
                  <br/>
                </td>
              </tr>
              <tr>
                <td>
                  <strong>@@loans@@</strong>
                </td>
              </tr>
              <tr>
                <td>
                  <table cellpadding="5" class="listing">
                    <xsl:attribute name="style">
                      <xsl:call-template name="mainTableStyleCss"/>
                      <!-- style.xsl -->
                    </xsl:attribute>
                    <tr>
                      <th>@@title@@</th>
                      <th>@@author@@</th>
                      <th>@@description@@</th>
                      <th>@@due_date@@</th>
                      <th>@@library@@</th>
                    </tr>
                    <xsl:for-each select="notification_data/item_loans/item_loan">
                      <tr>
                        <td>
                          <xsl:value-of select="title"/>
                        </td>
                        <td>
                          <xsl:value-of select="author"/>
                        </td>
                        <td>
                          <xsl:value-of select="description"/>
                        </td>
                        <td>
                          <xsl:choose>
                            <xsl:when test="/notification_data/short_loans='true'">
                              <xsl:call-template name="yyyymmdd">
                                <xsl:with-param name="inputDate" select="new_due_date_str"/>
                              </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:call-template name="yyyymmdd">
                                <xsl:with-param name="inputDate" select="due_date"/>
                              </xsl:call-template>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td>
                          <xsl:value-of select="library_name"/>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </table>
                </td>
              </tr>
            </table>
            <br/>
            <br/>
            <table role="presentation">
              <tr>
                <td>@@sincerely@@</td>
              </tr>
              <tr>
                <td>@@department@@</td>
              </tr>
            </table>
          </div>
        </div>
        <!-- footer.xsl -->
        <xsl:call-template name="lastFooter"/>
        <xsl:call-template name="myAccount"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
