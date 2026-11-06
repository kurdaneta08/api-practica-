Add-Type -AssemblyName System.Drawing
$width = 800
$height = 600
$bg = [System.Drawing.Color]::White

function New-Image($filename, $drawAction){
    $bmp = New-Object System.Drawing.Bitmap $width,$height
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.Clear($bg)
    & $drawAction $g
    $path = "C:\\www\\jr\\TodoApp\\src\\assets\\images\\repuestos\\$filename"
    $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Jpeg)
    $g.Dispose()
    $bmp.Dispose()
}

# Motor – block with two cylinders
New-Image "motor.jpg" { param($g)
    $pen = New-Object System.Drawing.Pen ([System.Drawing.Color]::Black,4)
    $brush = [System.Drawing.Brushes]::Gray
    $g.FillRectangle($brush,250,250,300,100)
    $g.DrawRectangle($pen,250,250,300,100)
    $g.FillEllipse($brush,260,180,80,80)
    $g.DrawEllipse($pen,260,180,80,80)
    $g.FillEllipse($brush,460,180,80,80)
    $g.DrawEllipse($pen,460,180,80,80)
}

# Caja – simple gearbox rectangle
New-Image "caja.jpg" { param($g)
    $pen = New-Object System.Drawing.Pen ([System.Drawing.Color]::Black,3)
    $brush = [System.Drawing.Brushes]::LightGray
    $g.FillRectangle($brush,250,250,300,150)
    $g.DrawRectangle($pen,250,250,300,150)
    # internal gear representation
    $g.DrawLine($pen,250,325,550,325)
    $g.DrawLine($pen,400,250,400,400)
}

# Tren Delantero – two wheels and axle
New-Image "tren-delantero.jpg" { param($g)
    $pen = New-Object System.Drawing.Pen ([System.Drawing.Color]::Black,3)
    $brush = [System.Drawing.Brushes]::DarkGray
    # axle line
    $g.DrawLine($pen,200,300,600,300)
    # wheels
    $g.FillEllipse($brush,180,260,80,80)
    $g.DrawEllipse($pen,180,260,80,80)
    $g.FillEllipse($brush,540,260,80,80)
    $g.DrawEllipse($pen,540,260,80,80)
    # suspension arms
    $g.DrawLine($pen,250,220,300,300)
    $g.DrawLine($pen,350,220,300,300)
    $g.DrawLine($pen,450,220,500,300)
    $g.DrawLine($pen,550,220,500,300)
}

# Lubricantes – three oil bottles
New-Image "lubricantes.jpg" { param($g)
    $pen = New-Object System.Drawing.Pen ([System.Drawing.Color]::Black,2)
    $brush = [System.Drawing.Brushes]::Blue
    for($i=0;$i -lt 3;$i++){
        $x = 200 + $i*150
        $g.FillRectangle($brush,$x,250,80,150)
        $g.DrawRectangle($pen,$x,250,80,150)
        $g.FillEllipse($brush,$x,230,80,40)
        $g.DrawEllipse($pen,$x,230,80,40)
    }
}

# Luces – LED headlight
New-Image "luces.jpg" { param($g)
    $pen = New-Object System.Drawing.Pen ([System.Drawing.Color]::Black,3)
    $brush = [System.Drawing.Brushes]::Yellow
    $rect = New-Object System.Drawing.Rectangle(300,250,200,120)
    $g.FillRectangle($brush,$rect)
    $g.DrawRectangle($pen,$rect)
    $g.DrawLine($pen,320,310,480,310)
    $g.DrawLine($pen,320,340,480,340)
}

# Filtro – rectangular filter with interior lines
New-Image "filtro.jpg" { param($g)
    $pen = New-Object System.Drawing.Pen ([System.Drawing.Color]::Black,3)
    $brush = [System.Drawing.Brushes]::LightGreen
    $g.FillRectangle($brush,350,200,100,200)
    $g.DrawRectangle($pen,350,200,100,200)
    for($y=230;$y -le 350;$y+=30){
        $g.DrawLine($pen,350,$y,450,$y)
    }
}
