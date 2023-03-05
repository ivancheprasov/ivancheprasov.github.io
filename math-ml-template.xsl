<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="UTF-8"/>
    <xsl:template match="/">
        <html>
            <head lang="en">
                <title>MathML</title>
                <script src="https://polyfill.io/v3/polyfill.min.js?features=es6">;</script>
                <script id="MathJax-script" async="" src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js">;</script>
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
                <math xmlns="http://www.w3.org/1998/Math/MathML">
                    <xsl:apply-templates/>
                </math>
                <div class="section__header">Original Content</div>
                <div id="original-content"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template name="tag">
        <xsl:param name="name"/>
        <xsl:element name="{$name}">
            <xsl:choose>
                <xsl:when test="./*">
                    <xsl:apply-templates select="*"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>
    <xsl:template match="node()">
        <xsl:choose>
            <xsl:when test="local-name() = 'строка'">
                <xsl:call-template name="tag">
                    <xsl:with-param name="name" select="'mrow'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="local-name() = 'операнд'">
                <xsl:call-template name="tag">
                    <xsl:with-param name="name" select="'mi'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="local-name() = 'оператор'">
                <xsl:call-template name="tag">
                    <xsl:with-param name="name" select="'mo'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="local-name() = 'корень'">
                <xsl:call-template name="tag">
                    <xsl:with-param name="name" select="'msqrt'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="local-name() = 'дробь'">
                <xsl:call-template name="tag">
                    <xsl:with-param name="name" select="'mfrac'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="local-name() = 'число'">
                <xsl:call-template name="tag">
                    <xsl:with-param name="name" select="'mn'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="local-name() = 'низверх'">
                <xsl:call-template name="tag">
                    <xsl:with-param name="name" select="'munderover'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="local-name() = 'верх'">
                <xsl:call-template name="tag">
                    <xsl:with-param name="name" select="'msup'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="local-name() = 'низ'">
                <xsl:call-template name="tag">
                    <xsl:with-param name="name" select="'msub'"/>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
