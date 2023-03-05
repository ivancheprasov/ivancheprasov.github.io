<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="root">
        <html>
            <head lang="en">
                <title>SVG</title>
                <style>
                    .section__header {
                        border: 1px solid red;
                        width: fit-content;
                        padding: 10px;
                        margin: 10px 0;
                    }
                </style>
            </head>
            <body>
                <div class="section__header">Result</div>
                <svg width="{графика/@ширина}" height="{графика/@высота}">
                    <xsl:apply-templates select="графика/эллипс"/>
                </svg>
                <div class="section__header">Original Content</div>
                <div id="original-content"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="эллипс">
        <ellipse id="{@id}" fill="{@заливка}" stroke="{@ободок}" stroke-width="{@ширина-ободка}" cx="{@cx}" cy="{@cy}" rx="{@rx}" ry="{@ry}"/>
    </xsl:template>
</xsl:stylesheet>
