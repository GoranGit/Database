<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <style>

        #table {
        display: table;
        border-collapse: collapse;
        }

        #th{
        display: table-header-group;
        font-weight: bold;
        }

        #tbody{
        display: table-row-group
        }

        .td{
        display: table-cell;
        border: 1px solid black;
        }

        .inner-td{
        border: none;
        }

        .tr{
        display: table-row;
        }
      </style>
      <body>
        <div id="table">
          <div id="th">
            <div class="td">Name</div>
            <div class="td">Artist</div>
            <div class="td">Year</div>
            <div class="td">Producer</div>
            <div class="td">Price</div>
            <div class="td">Songs</div>
          </div>
          <div id="tbody">
            <xsl:for-each select="catalogue/album">
              <div class="tr">
                <div class="td">
                  <xsl:value-of select="name"/>
                </div>
                <div class="td">
                  <xsl:value-of select="artist"/>
                </div>
                <div class="td">
                  <xsl:value-of select="year"/>
                </div>
                <div class="td">
                  <xsl:value-of select="producer"/>
                </div>
                <div class="td">
                  <xsl:value-of select="price"/>
                </div>
                <div class="td">
                  <xsl:for-each select="songs/song">
                    <div class="inner-td">
                      <strong>
                        <xsl:value-of select="title" />
                        <br />
                      </strong>
                      duration: <xsl:value-of select="duration" />
                    </div>
                  </xsl:for-each>
                </div>
              </div>
            </xsl:for-each>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>