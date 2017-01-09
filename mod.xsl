<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="*" name="percent">
        <xsl:param name="delta"/>
        <xsl:choose>
            <xsl:when test="$delta &gt; 0">
                <font color="red">+<xsl:value-of select="format-number($delta,'#.00%')"/></font>
            </xsl:when>
            <xsl:otherwise>
                <font color="green"><xsl:value-of select="format-number($delta,'#.00%')"/></font>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="/root" name="wurui.stock-analysis">
        <xsl:param name="detailLink"/>

        <!-- className 'J_OXMod' required  -->
        <div class="J_OXMod oxmod-stock-analysis" ox-mod="stock-analysis">
            <h3>Low price list</h3>
            <table cellpadding="0" cellspacing="0" class="maintable">
                <thead>
                    <th>Symbol</th>
                    <th>close</th>
                    <th>med</th>
                    <th>avg</th>
                    <th>&#160;</th>
                </thead>
                <tbody>
                    <xsl:for-each select="data/stock-analysis/i">
                    <tr>
                        <td><xsl:value-of select="symbol"/></td>
                        <td><xsl:value-of select="close"/></td>
                        <td>
                            <xsl:value-of select="med"/>
                            (<xsl:call-template name="percent"><xsl:with-param name="delta" select="(close - med) div med"/></xsl:call-template>)
                        </td>
                        <td>
                            <xsl:value-of select="avg"/>
                            (<xsl:call-template name="percent"><xsl:with-param name="delta" select="(close - avg) div avg"/></xsl:call-template>)
                        </td>
                        <td><a href="{$detailLink}?symbol={normalize-space(symbol)}">detail</a></td>
                    </tr>
                    </xsl:for-each>
                </tbody>
            </table>
          </div>
    </xsl:template>

</xsl:stylesheet>
