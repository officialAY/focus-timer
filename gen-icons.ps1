Add-Type -AssemblyName System.Drawing

function New-Icon {
    param([int]$Size, [string]$Path)

    $bmp = New-Object System.Drawing.Bitmap $Size, $Size
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.Clear([System.Drawing.Color]::Transparent)

    # background: rounded-ish square, dark bg
    $bgColor = [System.Drawing.Color]::FromArgb(255, 21, 24, 29)   # #15181D
    $bgBrush = New-Object System.Drawing.SolidBrush $bgColor
    $radius = [int]($Size * 0.18)
    $rect = New-Object System.Drawing.Rectangle 0, 0, $Size, $Size
    $gp = New-Object System.Drawing.Drawing2D.GraphicsPath
    $d = $radius * 2
    $gp.AddArc(0, 0, $d, $d, 180, 90)
    $gp.AddArc($Size - $d, 0, $d, $d, 270, 90)
    $gp.AddArc($Size - $d, $Size - $d, $d, $d, 0, 90)
    $gp.AddArc(0, $Size - $d, $d, $d, 90, 90)
    $gp.CloseFigure()
    $g.FillPath($bgBrush, $gp)

    # ring: orange session color
    $ringColor = [System.Drawing.Color]::FromArgb(255, 232, 150, 61)  # #E8963D
    $penWidth = [Math]::Max(2, [int]($Size * 0.055))
    $pen = New-Object System.Drawing.Pen $ringColor, $penWidth
    $margin = [int]($Size * 0.16)
    $ringRect = New-Object System.Drawing.Rectangle $margin, $margin, ($Size - 2*$margin), ($Size - 2*$margin)
    $g.DrawArc($pen, $ringRect, -90, 300)

    # clock hands
    $cx = $Size / 2.0
    $cy = $Size / 2.0
    $handPen = New-Object System.Drawing.Pen $ringColor, $penWidth
    $handPen.StartCap = [System.Drawing.Drawing2D.LineCap]::Round
    $handPen.EndCap = [System.Drawing.Drawing2D.LineCap]::Round
    $g.DrawLine($handPen, $cx, $cy, $cx, $cy - $Size * 0.22)
    $g.DrawLine($handPen, $cx, $cy, $cx + $Size * 0.15, $cy)

    $bmp.Save($Path, [System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose()
    $bmp.Dispose()
}

New-Item -ItemType Directory -Force -Path "C:\Users\ayool\focus-timer\icons" | Out-Null
New-Icon -Size 192 -Path "C:\Users\ayool\focus-timer\icons\icon-192.png"
New-Icon -Size 512 -Path "C:\Users\ayool\focus-timer\icons\icon-512.png"
New-Icon -Size 180 -Path "C:\Users\ayool\focus-timer\icons\apple-touch-icon.png"
Write-Output "done"
