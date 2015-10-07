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
            <div class="td">Sex</div>
            <div class="td">Birth date</div>
            <div class="td">Phone</div>
            <div class="td">Email</div>
            <div class="td">Course</div>
            <div class="td">Speciality</div>
            <div class="td">Faculty Number</div>
            <div class="td">Exams</div>
            <div class="td">Enrolment</div>
            <div class="td">Endorsements</div>
          </div>
          <div id="tbody">
            <xsl:for-each select="students/student">
              <div class="tr">
                <div class="td">
                  <xsl:value-of select="name"/>
                </div>
                <div class="td">
                  <xsl:value-of select="sex"/>
                </div>
                <div class="td">
                  <xsl:value-of select="birth-date"/>
                </div>
                <div class="td">
                  <xsl:value-of select="phone"/>
                </div>
                <div class="td">
                  <xsl:value-of select="email"/>
                </div>
                <div class="td">
                  <xsl:value-of select="course"/>
                </div>
                <div class="td">
                  <xsl:value-of select="speciality"/>

                </div>
                <div class="td">
                  <xsl:value-of select="faculty-number"/>
                </div>
                <div class="td">
                  <xsl:for-each select="exams/exam">
                    <div class="inner-td">
                      <strong>
                        <xsl:value-of select="exam-name" />
                        <br />
                      </strong>
                      tutor: <xsl:value-of select="tutor"/><br />
                      score: <xsl:value-of select="score" />
                    </div>
                  </xsl:for-each>
                </div>
                <div class="td">
                  Date: <xsl:value-of select="enrollment/date" /><br />
                  Score: <xsl:value-of select="enrollment/score" />
                </div>
                <div class="td">
                  <xsl:for-each select="teacher-endorsments/teacher-endorsment">
                    <div>
                      <strong>
                        <xsl:value-of select="teacher-name" />:
                      </strong>
                      <xsl:value-of select="endorsment" />
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