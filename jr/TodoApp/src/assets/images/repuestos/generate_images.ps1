Add-Type -AssemblyName System.Drawing
$width = 800
$height = 600
$bgColor = [System.Drawing.Color]::White

function Save-Image($name, $drawAction) {
    $bmp = New-Object System.Drawing.Bitmap $width, $height
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.Clear($bgColor)
    & $drawAction $g
    $path = "C:\\www\\jr\\TodoApp\\src\\assets\\images\\repuestos\\$name"
    $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Jpeg)
    $g.Dispose()
    $bmp.Dispose()
}

# Motor: engine block with two cylinders
Save-Image "motor.jpg" { param($g)
    $pen = New-Object System.Drawing.Pen ([System.Drawing.Color]::Black, 4)
    $brush = [System.Drawing.Brushes]::Gray
    # block
    $g.FillRectangle($brush, 250, 250, 300, 100)
    $g.DrawRectangle($pen, 250, 250, 300, 100)
    # cylinders
    $g.FillEllipse($brush, 260, 180, 80, 80)
    $g.DrawEllipse($pen, 260, 180, 80, 80)
    $g.FillEllipse($brush, 460, 180, 80, 80)
    $g.DrawEllipse($pen, 460, 180, 80, 80)
}

# Caja (gearbox): rectangle with gear teeth
Save-Image "caja.jpg" { param($g)
    $pen = New-Object System.Drawing.Pen ([System.Drawing.Color]::Black, 3)
    $brush = [System.Drawing.Brushes]::LightGray
    $g.FillRectangle($brush, 250, 250, 300, 150)
    $g.DrawRectangle($pen, 250, 250, 300, 150)
    # gear teeth (simple triangles)
    for($i=0;$i -le 5;$i++){
        $x = 250 + $i*50
        $points = @(
            New-Object System.Drawing.Point($x,250),
            New-Object System.Drawing.Point($x+25,230),
            New-Object System.Drawing.Point($x+50,250)
        )
        $g.FillPolygon([System.Drawing.Brushes]::DarkGray, $points)
        $g.DrawPolygon($pen, $points)
    }
}

# Tren Delantero: simple suspension arms and wheels
Save-Image "tren-delantero.jpg" { param($g)
    $pen = New-Object System.Drawing.Pen ([System.Drawing.Color]::Black, 3)
    $brush = [System.Drawing.Brushes]::DarkGray
    # axle
    $g.DrawLine($pen, 200, 300, 600, 300)
    # left wheel
    $g.FillEllipse($brush, 180, 300, 60, 60)
    $g.DrawEllipse($pen, 180, 300, 60, 60)
    # right wheel
    $g.FillEllipse($brush, 560, 300, 60, 60)
    $g.DrawEllipse($pen, 560, 300, 60, 60)
    # suspension arms
    $g.DrawLine($pen, 250, 250, 300, 300)
    $g.DrawLine($pen, 350, 250, 300, 300)
    $g.DrawLine($pen, 450, 250, 500, 300)
    $g.DrawLine($pen, 550, 250, 500, 300)
}

# Lubricantes: three oil bottles
Save-Image "lubricantes.jpg" { param($g)
    $pen = New-Object System.Drawing.Pen ([System.Drawing.Color]::Black, 2)
    $brush = [System.Drawing.Brushes]::Blue
    for($i=0;$i -lt 3;$i++){
        $x = 200 + $i*150
        $g.FillRectangle($brush, $x, 250, 80, 150)
        $g.DrawRectangle($pen, $x, 250, 80, 150)
        # rounded top
        $g.FillEllipse($brush, $x, 230, 80, 40)
        $g.DrawEllipse($pen, $x, 230, 80, 40)
    }
}

# Luces: simple LED headlight
Save-Image "luces.jpg" { param($g)
    $pen = New-Object System.Drawing.Pen ([System.Drawing.Color]::Black, 3)
    $brush = [System.Drawing.Brushes]::Yellow
    $rect = New-Object System.Drawing.Rectangle(300,250,200,120)
    $g.FillRectangle($brush,$rect)
    $g.DrawRectangle($pen,$rect)
    # inner filament lines
    $g.DrawLine($pen,320,310,460,310)
    $g.DrawLine($pen,320,340,460,340)
}

# Filtro: cylindrical filter with horizontal lines
Save-Image "filtro.jpg" { param($g)
    $pen = New-Object System.Drawing.Pen ([System.Drawing.Color]::Black, 3)
    $brush = [System.Drawing.Brushes]::LightGreen
    $g.FillRectangle($brush, 350, 200, 100, 200)
    $g.DrawRectangle($pen, 350, 200, 100, 200)
    for($y=230;$y -le 350;$y+=30){
        $g.DrawLine($pen, 350, $y, 450, $y)
    }
}
