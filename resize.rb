#!/usr/bin/env ruby -wKU
require 'RMagick'
include Magick

Dir.foreach("drawable-hdpi") {|x|
  if /png/.match(x)||/jpg/.match(x) then
   myPic = Image.read("drawable-hdpi/"+x.to_s).first
   currentColumn = myPic.columns
   currentRows = myPic.rows

   mdpiColumns = currentColumn*0.67
   mdpiRows = currentRows*0.67

   ldpiColumns = currentColumn*0.5
   ldpiRows = currentRows*0.5

   puts  'ORIGINAL-HDPI: ' + currentColumn.to_s + 'x' + currentRows.to_s
   puts  'MDPI: ' + mdpiColumns.to_s + 'x' + mdpiRows.to_s
   puts  'LDPI: ' + ldpiColumns.to_s + 'x' + ldpiRows.to_s
   puts '----------------------------------'

   #TRAITEMENT MDPI
   myPic.change_geometry(mdpiColumns.to_s+'x'+mdpiRows.to_s) { |cols, rows, img|
     img2 = img.resize(mdpiColumns, mdpiRows)
     img2.write('png:drawable-mdpi/'+x)
   }

   #TRAITEMENT LDPI
   myPic.change_geometry(ldpiColumns.to_s+'x'+ldpiRows.to_s) { |cols, rows, img|
     img2 = img.resize(ldpiColumns, ldpiRows)
     img2.write('png:drawable-ldpi/'+x)
   }
  end
}






