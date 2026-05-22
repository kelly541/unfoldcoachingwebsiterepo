<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
                xmlns:html="http://www.w3.org/TR/REC-html40"
                xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
                xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>XML Sitemap | UnFold Coaching</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <style type="text/css">
          body {
            font-family: Georgia, serif;
            background-color: #F5EDE3; /* cream */
            color: #2C1F14; /* ink */
            margin: 0;
            padding: 40px;
          }
          h1 {
            color: #3D6080; /* slate */
            font-size: 32px;
            margin-bottom: 10px;
          }
          p {
            font-family: Arial, sans-serif;
            font-size: 14px;
            color: #5C4030; /* ink-light */
          }
          table {
            width: 100%;
            max-width: 1000px;
            border-collapse: collapse;
            background-color: #FEFAF6; /* white */
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.06);
            margin-top: 30px;
          }
          th, td {
            padding: 16px;
            text-align: left;
            border-bottom: 1px solid #EAD9C8; /* cream-dark */
            font-family: Arial, sans-serif;
            font-size: 14px;
          }
          th {
            background-color: #3D6080; /* slate */
            color: #FEFAF6;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 12px;
          }
          tr:last-child td {
            border-bottom: none;
          }
          tr:hover td {
            background-color: #F5E8DF; /* terra-pale */
          }
          a {
            color: #D4714A; /* terra */
            text-decoration: none;
          }
          a:hover {
            color: #E8956E; /* terra-light */
            text-decoration: underline;
          }
          .url-count {
            margin-top: 20px;
            font-family: Arial, sans-serif;
            font-size: 12px;
            color: #6A90B0; /* slate-light */
          }
        </style>
      </head>
      <body>
        <h1>XML Sitemap</h1>
        <p>This is an XML Sitemap generated to help search engines like Google better index the website.</p>
        <p>You can find more information about XML sitemaps at <a href="http://sitemaps.org" target="_blank">sitemaps.org</a>.</p>
        
        <table>
          <thead>
            <tr>
              <th>URL</th>
              <th>Priority</th>
              <th>Change Frequency</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="sitemap:urlset/sitemap:url">
              <tr>
                <td>
                  <xsl:variable name="itemURL">
                    <xsl:value-of select="sitemap:loc"/>
                  </xsl:variable>
                  <a href="{$itemURL}" target="_blank">
                    <xsl:value-of select="sitemap:loc"/>
                  </a>
                </td>
                <td>
                  <xsl:value-of select="concat(sitemap:priority*100,'%')"/>
                </td>
                <td>
                  <xsl:value-of select="sitemap:changefreq"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <div class="url-count">
          Total URLs in this sitemap: <xsl:value-of select="count(sitemap:urlset/sitemap:url)"/>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
