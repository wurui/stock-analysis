<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxm="https://www.openxsl.com">

    <xsl:template match="*" name="percent">
        <xsl:param name="delta"/>
        <xsl:choose>
            <xsl:when test="$delta &gt; 0">
                <em class="percent positive">+<xsl:value-of select="format-number($delta,'0.00%')"/></em>
            </xsl:when>
            <xsl:otherwise>
                <em class="percent negative"><xsl:value-of select="format-number($delta,'0.00%')"/></em>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="/root" name="wurui.stock-analysis">
        <xsl:param name="title" oxm:comment="title of module"/>
        <xsl:param name="detailLink"/>


        <!-- className 'J_OXMod' required  -->
        <div class="J_OXMod oxmod-stock-analysis" ox-mod="stock-analysis">
            <h3>
                <xsl:value-of select="$title"/>
            </h3>
            <table cellpadding="0" cellspacing="0" class="maintable">

                <tbody>
                    <xsl:for-each select="data/stock-analysis/i">
                    <tr data-href="{$detailLink}#{normalize-space(symbol)}">
                        <td><xsl:value-of select="symbol"/></td>
                        <td>
                            <xsl:value-of select="med"/>
                        </td>
                        <td align="right">
                            <xsl:value-of select="close"/>
                            <xsl:call-template name="percent"><xsl:with-param name="delta" select="(close - med) div med"/></xsl:call-template>
                        </td>
                    </tr>
                    </xsl:for-each>
                </tbody>
            </table>
          </div>

    </xsl:template>

</xsl:stylesheet>
