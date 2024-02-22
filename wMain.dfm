object WinMain: TWinMain
  Left = 251
  Top = 148
  Width = 905
  Height = 804
  Caption = 'Cube'
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pSplitter: TSplitter
    Left = 0
    Top = 25
    Height = 726
  end
  object pControl: TPageControl
    Left = 3
    Top = 25
    Width = 894
    Height = 726
    ActivePage = pLevel
    Align = alClient
    TabOrder = 0
    object pCreate: TTabSheet
      Caption = 'Create'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ImageIndex = 3
      ParentFont = False
      object gCube: TGroupBox
        Left = 0
        Top = 0
        Width = 886
        Height = 83
        Align = alTop
        Caption = 'Cube'
        TabOrder = 0
        object lX: TLabel
          Left = 5
          Top = 18
          Width = 37
          Height = 13
          Caption = 'Size X'
        end
        object lY: TLabel
          Left = 5
          Top = 39
          Width = 37
          Height = 13
          Caption = 'Size Y'
        end
        object lZ: TLabel
          Left = 5
          Top = 60
          Width = 37
          Height = 13
          Caption = 'Size Z'
        end
        object eX: TMaskEdit
          Left = 100
          Top = 10
          Width = 120
          Height = 19
          TabOrder = 0
          Text = '100'
        end
        object eY: TMaskEdit
          Left = 100
          Top = 32
          Width = 120
          Height = 19
          TabOrder = 1
          Text = '100'
        end
        object eZ: TMaskEdit
          Left = 100
          Top = 54
          Width = 120
          Height = 19
          TabOrder = 2
          Text = '100'
        end
      end
      object gRatio: TGroupBox
        Left = 0
        Top = 83
        Width = 886
        Height = 84
        Align = alTop
        Caption = 'Ratio'
        TabOrder = 1
        object lSemiconductor: TLabel
          Left = 5
          Top = 39
          Width = 85
          Height = 13
          Caption = 'Semiconductor'
        end
        object lDielectric: TLabel
          Left = 5
          Top = 17
          Width = 55
          Height = 13
          Caption = 'Dielectric'
        end
        object lConductor: TLabel
          Left = 5
          Top = 60
          Width = 59
          Height = 13
          Caption = 'Conductor'
        end
        object eConductor: TMaskEdit
          Left = 100
          Top = 58
          Width = 120
          Height = 19
          Color = 8454016
          TabOrder = 0
          Text = '0.8'
        end
        object eDielectric: TMaskEdit
          Left = 100
          Top = 14
          Width = 120
          Height = 19
          Color = 8421631
          TabOrder = 1
          Text = '0.1'
        end
        object eSemiconductor: TMaskEdit
          Left = 100
          Top = 36
          Width = 120
          Height = 19
          Color = 8454143
          TabOrder = 2
          Text = '0.1'
        end
        object bCreate: TBitBtn
          Left = 248
          Top = 19
          Width = 75
          Height = 25
          Caption = 'Create'
          TabOrder = 3
          OnClick = bCreateClick
          Kind = bkRetry
        end
        object bClear: TBitBtn
          Left = 248
          Top = 51
          Width = 75
          Height = 25
          Caption = 'Clear'
          ModalResult = 2
          TabOrder = 4
          OnClick = bClearClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333333333000033338833333333333333333F333333333333
            0000333911833333983333333388F333333F3333000033391118333911833333
            38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
            911118111118333338F3338F833338F3000033333911111111833333338F3338
            3333F8330000333333911111183333333338F333333F83330000333333311111
            8333333333338F3333383333000033333339111183333333333338F333833333
            00003333339111118333333333333833338F3333000033333911181118333333
            33338333338F333300003333911183911183333333383338F338F33300003333
            9118333911183333338F33838F338F33000033333913333391113333338FF833
            38F338F300003333333333333919333333388333338FFF830000333333333333
            3333333333333333333888330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
      end
      object gElectrons: TGroupBox
        Left = 0
        Top = 167
        Width = 886
        Height = 46
        Align = alTop
        Caption = 'Electrons'
        TabOrder = 2
        object lElectrond: TLabel
          Left = 5
          Top = 17
          Width = 44
          Height = 13
          Caption = 'Number'
        end
        object eNumElectrons: TMaskEdit
          Left = 100
          Top = 15
          Width = 100
          Height = 19
          TabOrder = 0
          Text = '1000'
        end
      end
      object gLevel2: TGroupBox
        Left = 0
        Top = 305
        Width = 886
        Height = 46
        Align = alTop
        Caption = 'Level statistics 2'
        TabOrder = 3
        object lLeval2: TLabel
          Left = 5
          Top = 17
          Width = 43
          Height = 13
          Caption = 'Level 2'
        end
        object eLevel2: TMaskEdit
          Left = 100
          Top = 15
          Width = 100
          Height = 19
          TabOrder = 0
          Text = '30'
        end
      end
      object gLevel1: TGroupBox
        Left = 0
        Top = 259
        Width = 886
        Height = 46
        Align = alTop
        Caption = 'Level statistics 1'
        TabOrder = 4
        object llavel1: TLabel
          Left = 5
          Top = 17
          Width = 43
          Height = 13
          Caption = 'Level 1'
        end
        object eLevel1: TMaskEdit
          Left = 100
          Top = 15
          Width = 100
          Height = 19
          TabOrder = 0
          Text = '10'
        end
      end
      object gSteps: TGroupBox
        Left = 0
        Top = 213
        Width = 886
        Height = 46
        Align = alTop
        Caption = 'Steps'
        TabOrder = 5
        object lStep: TLabel
          Left = 5
          Top = 17
          Width = 44
          Height = 13
          Caption = 'Number'
        end
        object eSteps: TMaskEdit
          Left = 100
          Top = 15
          Width = 100
          Height = 19
          TabOrder = 0
          Text = '1000'
        end
      end
      object gStat: TGroupBox
        Left = 0
        Top = 397
        Width = 886
        Height = 46
        Align = alTop
        Caption = 'Show statistics'
        TabOrder = 6
        object lStat: TLabel
          Left = 5
          Top = 17
          Width = 61
          Height = 13
          Caption = 'Every step'
        end
        object eStat: TMaskEdit
          Left = 100
          Top = 15
          Width = 100
          Height = 19
          TabOrder = 0
          Text = '100'
        end
        object bStop: TBitBtn
          Left = 336
          Top = 11
          Width = 75
          Height = 25
          Caption = 'Cancel'
          TabOrder = 1
          OnClick = bStopClick
          Kind = bkNo
        end
        object bGo: TBitBtn
          Left = 232
          Top = 11
          Width = 75
          Height = 25
          Caption = 'Go'
          TabOrder = 2
          OnClick = bGoClick
          Kind = bkIgnore
        end
      end
      object gLevel3: TGroupBox
        Left = 0
        Top = 351
        Width = 886
        Height = 46
        Align = alTop
        Caption = 'Level statistics 3'
        TabOrder = 7
        object lLavel3: TLabel
          Left = 5
          Top = 17
          Width = 43
          Height = 13
          Caption = 'Level 3'
        end
        object eLevel3: TMaskEdit
          Left = 100
          Top = 15
          Width = 100
          Height = 19
          TabOrder = 0
          Text = '50'
        end
      end
    end
    object pConductors: TTabSheet
      Caption = 'Conductors'
      object sConductors: TSLScope
        Left = 0
        Top = 0
        Width = 886
        Height = 698
        Cursor = crDefault
        Align = alClient
        Zooming.Mode = zmBoth
        NavigateMode = nmZoom
        TabOrder = 0
        InputPins.Count = 3
        InputPins.Form = WinMain
        XInputPins.Count = 3
        XInputPins.Form = WinMain
        YAxis.Align = vaLeft
        YAxis.MinorTicks.Count = 0
        YAxis.MajorTicks.Step = 10.000000000000000000
        YAxis.Font.Charset = DEFAULT_CHARSET
        YAxis.Font.Color = clWhite
        YAxis.Font.Height = -11
        YAxis.Font.Name = 'Arial'
        YAxis.Font.Style = []
        YAxis.AxisLabel.Font.Charset = DEFAULT_CHARSET
        YAxis.AxisLabel.Font.Color = clWhite
        YAxis.AxisLabel.Font.Height = -13
        YAxis.AxisLabel.Font.Name = 'Arial'
        YAxis.AxisLabel.Font.Style = [fsBold]
        YAxis.AxisLabel.Text = 'Number'
        YAxis.Format.PrecisionMode = dpmGeneral
        YAxis.Min.Range.High.Enabled = False
        YAxis.Min.Range.Low.Enabled = False
        YAxis.Min.Value = -1000.000000000000000000
        YAxis.Max.Range.High.Enabled = False
        YAxis.Max.Range.Low.Enabled = False
        YAxis.Max.Value = 1000.000000000000000000
        YAxis.Zooming.Range.High.Enabled = False
        YAxis.Zooming.Range.Low.Enabled = True
        YAxis.DataView.Lines.Pen.Color = clGreen
        YAxis.DataView.ZeroLine.Pen.Color = clWhite
        YAxis.AdditionalAxes = <>
        YAxis.MinMax = (
          -1000.000000000000000000
          1000.000000000000000000
          -1000.000000000000000000
          1000.000000000000000000
          -1000.000000000000000000
          1000.000000000000000000
          0.000000100000000000
          100000000.000000000000000000)
        XAxis.Align = vaBottom
        XAxis.MinorTicks.Count = 0
        XAxis.MajorTicks.Step = 10.000000000000000000
        XAxis.Font.Charset = DEFAULT_CHARSET
        XAxis.Font.Color = clWhite
        XAxis.Font.Height = -11
        XAxis.Font.Name = 'Arial'
        XAxis.Font.Style = []
        XAxis.AxisLabel.Font.Charset = DEFAULT_CHARSET
        XAxis.AxisLabel.Font.Color = clWhite
        XAxis.AxisLabel.Font.Height = -13
        XAxis.AxisLabel.Font.Name = 'Arial'
        XAxis.AxisLabel.Font.Style = [fsBold]
        XAxis.AxisLabel.Text = 'Level'
        XAxis.Format.PrecisionMode = dpmGeneral
        XAxis.TicksMode = atmAuto
        XAxis.UnitScale.Exponent = 0
        XAxis.Min.Range.High.Enabled = False
        XAxis.Min.Range.Low.Enabled = False
        XAxis.Min.Tick.Value = 0.000000000000000000
        XAxis.Min.Value = 0.000000000000000000
        XAxis.Max.Range.High.Enabled = False
        XAxis.Max.Range.Low.Enabled = False
        XAxis.Max.Tick.Value = 1024.000000000000000000
        XAxis.Max.Mode = mamValue
        XAxis.Max.Value = 1024.000000000000000000
        XAxis.Zooming.Range.High.Enabled = False
        XAxis.Zooming.Range.Low.Enabled = True
        XAxis.DataView.Lines.Pen.Color = clGreen
        XAxis.DataView.ZeroLine.Pen.Color = clWhite
        XAxis.AdditionalAxes = <>
        XAxis.MinMaxRange = (
          -1000.000000000000000000
          1000.000000000000000000
          -1000.000000000000000000
          1000.000000000000000000
          0.000000100000000000
          100000000.000000000000000000)
        Legend.Align = vaRight
        Legend.Font.Charset = DEFAULT_CHARSET
        Legend.Font.Color = clWhite
        Legend.Font.Height = -11
        Legend.Font.Name = 'Arial'
        Legend.Font.Style = []
        Legend.Channels.Caption.Font.Charset = DEFAULT_CHARSET
        Legend.Channels.Caption.Font.Color = clWhite
        Legend.Channels.Caption.Font.Height = -13
        Legend.Channels.Caption.Font.Name = 'Arial'
        Legend.Channels.Caption.Font.Style = []
        Legend.ChannelLinks.Caption.Font.Charset = DEFAULT_CHARSET
        Legend.ChannelLinks.Caption.Font.Color = clWhite
        Legend.ChannelLinks.Caption.Font.Height = -13
        Legend.ChannelLinks.Caption.Font.Name = 'Arial'
        Legend.ChannelLinks.Caption.Font.Style = []
        Legend.MarkerGroups.Caption.Font.Charset = DEFAULT_CHARSET
        Legend.MarkerGroups.Caption.Font.Color = clWhite
        Legend.MarkerGroups.Caption.Font.Height = -13
        Legend.MarkerGroups.Caption.Font.Name = 'Arial'
        Legend.MarkerGroups.Caption.Font.Style = []
        Legend.Zones.Caption.Font.Charset = DEFAULT_CHARSET
        Legend.Zones.Caption.Font.Color = clWhite
        Legend.Zones.Caption.Font.Height = -13
        Legend.Zones.Caption.Font.Name = 'Arial'
        Legend.Zones.Caption.Font.Style = []
        Legend.Ellipses.Caption.Font.Charset = DEFAULT_CHARSET
        Legend.Ellipses.Caption.Font.Color = clWhite
        Legend.Ellipses.Caption.Font.Height = -13
        Legend.Ellipses.Caption.Font.Name = 'Arial'
        Legend.Ellipses.Caption.Font.Style = []
        Legend.Cursors.Caption.Font.Charset = DEFAULT_CHARSET
        Legend.Cursors.Caption.Font.Color = clWhite
        Legend.Cursors.Caption.Font.Height = -13
        Legend.Cursors.Caption.Font.Name = 'Arial'
        Legend.Cursors.Caption.Font.Style = []
        Legend.CursorLinks.Caption.Font.Charset = DEFAULT_CHARSET
        Legend.CursorLinks.Caption.Font.Color = clWhite
        Legend.CursorLinks.Caption.Font.Height = -13
        Legend.CursorLinks.Caption.Font.Name = 'Arial'
        Legend.CursorLinks.Caption.Font.Style = []
        Legend.CustomGroups = <>
        Title.Align = vaTop
        Title.Text = 'Ratio of conductors'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -21
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        DataView.Border.Pen.Color = clGreen
        Trails.Font.Charset = DEFAULT_CHARSET
        Trails.Font.Color = clWhite
        Trails.Font.Height = -11
        Trails.Font.Name = 'Arial'
        Trails.Font.Style = []
        Highlighting.MouseHitPoint.PointLabel.Font.Charset = DEFAULT_CHARSET
        Highlighting.MouseHitPoint.PointLabel.Font.Color = clWhite
        Highlighting.MouseHitPoint.PointLabel.Font.Height = -11
        Highlighting.MouseHitPoint.PointLabel.Font.Name = 'Arial'
        Highlighting.MouseHitPoint.PointLabel.Font.Style = []
        MarkerGroups = <>
        Zones = <>
        Ellipses = <>
        Channels = <
          item
            Name = 'Dielectric'
            Color = clRed
            Points.Visible = False
            Points.Shape = psCircle
            Points.Brush.Color = clRed
            Points.Brush.Style = bsSolid
            Points.Pen.Color = clRed
            ChannelMode = cmLine
            ShadeMode = csmZero
            Markers = <>
            AxisIndex_ = (
              0
              0)
          end
          item
            Name = 'Semiconductor'
            Color = clLime
            Points.Visible = False
            Points.Shape = psCircle
            Points.Brush.Color = clRed
            Points.Brush.Style = bsSolid
            Points.Pen.Color = clRed
            ChannelMode = cmLine
            ShadeMode = csmZero
            Markers = <>
            AxisIndex_ = (
              0
              0)
          end
          item
            Name = 'Conductor'
            Color = clBlue
            Points.Visible = False
            Points.Shape = psCircle
            Points.Brush.Color = clRed
            Points.Brush.Style = bsSolid
            Points.Pen.Color = clRed
            ChannelMode = cmLine
            ShadeMode = csmZero
            Markers = <>
            AxisIndex_ = (
              0
              0)
          end>
        Cursors = <>
        CursorLinks = <>
        ChannelLinks = <>
      end
    end
    object pElectron: TTabSheet
      Caption = 'Electrons'
      ImageIndex = 1
      object sElectrons: TSLScope
        Left = 0
        Top = 0
        Width = 886
        Height = 698
        Cursor = crDefault
        Align = alClient
        Zooming.Mode = zmBoth
        NavigateMode = nmZoom
        TabOrder = 0
        InputPins.Count = 1
        InputPins.Form = WinMain
        XInputPins.Count = 1
        XInputPins.Form = WinMain
        YAxis.Align = vaLeft
        YAxis.MinorTicks.Count = 0
        YAxis.MajorTicks.Step = 10.000000000000000000
        YAxis.Font.Charset = DEFAULT_CHARSET
        YAxis.Font.Color = clWhite
        YAxis.Font.Height = -11
        YAxis.Font.Name = 'Arial'
        YAxis.Font.Style = []
        YAxis.AxisLabel.Font.Charset = DEFAULT_CHARSET
        YAxis.AxisLabel.Font.Color = clWhite
        YAxis.AxisLabel.Font.Height = -13
        YAxis.AxisLabel.Font.Name = 'Arial'
        YAxis.AxisLabel.Font.Style = [fsBold]
        YAxis.AxisLabel.Text = 'Electrons'
        YAxis.Format.PrecisionMode = dpmGeneral
        YAxis.Min.Range.High.Enabled = False
        YAxis.Min.Range.Low.Enabled = False
        YAxis.Min.Value = -1000.000000000000000000
        YAxis.Max.Range.High.Enabled = False
        YAxis.Max.Range.Low.Enabled = False
        YAxis.Max.Value = 1000.000000000000000000
        YAxis.Zooming.Range.High.Enabled = False
        YAxis.Zooming.Range.Low.Enabled = True
        YAxis.DataView.Lines.Pen.Color = clGreen
        YAxis.DataView.ZeroLine.Pen.Color = clWhite
        YAxis.AdditionalAxes = <>
        YAxis.MinMax = (
          -1000.000000000000000000
          1000.000000000000000000
          -1000.000000000000000000
          1000.000000000000000000
          -1000.000000000000000000
          1000.000000000000000000
          0.000000100000000000
          100000000.000000000000000000)
        XAxis.Align = vaBottom
        XAxis.MinorTicks.Count = 0
        XAxis.MajorTicks.Step = 10.000000000000000000
        XAxis.Font.Charset = DEFAULT_CHARSET
        XAxis.Font.Color = clWhite
        XAxis.Font.Height = -11
        XAxis.Font.Name = 'Arial'
        XAxis.Font.Style = []
        XAxis.AxisLabel.Font.Charset = DEFAULT_CHARSET
        XAxis.AxisLabel.Font.Color = clWhite
        XAxis.AxisLabel.Font.Height = -13
        XAxis.AxisLabel.Font.Name = 'Arial'
        XAxis.AxisLabel.Font.Style = [fsBold]
        XAxis.AxisLabel.Text = 'Level'
        XAxis.Format.PrecisionMode = dpmGeneral
        XAxis.TicksMode = atmAuto
        XAxis.UnitScale.Exponent = 0
        XAxis.Min.Range.High.Enabled = False
        XAxis.Min.Range.Low.Enabled = False
        XAxis.Min.Tick.Value = 0.000000000000000000
        XAxis.Min.Value = 0.000000000000000000
        XAxis.Max.Range.High.Enabled = False
        XAxis.Max.Range.Low.Enabled = False
        XAxis.Max.Tick.Value = 1024.000000000000000000
        XAxis.Max.Mode = mamValue
        XAxis.Max.Value = 1024.000000000000000000
        XAxis.Zooming.Range.High.Enabled = False
        XAxis.Zooming.Range.Low.Enabled = True
        XAxis.DataView.Lines.Pen.Color = clGreen
        XAxis.DataView.ZeroLine.Pen.Color = clWhite
        XAxis.AdditionalAxes = <>
        XAxis.MinMaxRange = (
          -1000.000000000000000000
          1000.000000000000000000
          -1000.000000000000000000
          1000.000000000000000000
          0.000000100000000000
          100000000.000000000000000000)
        Legend.Align = vaRight
        Legend.Font.Charset = DEFAULT_CHARSET
        Legend.Font.Color = clWhite
        Legend.Font.Height = -11
        Legend.Font.Name = 'Arial'
        Legend.Font.Style = []
        Legend.Channels.Caption.Font.Charset = DEFAULT_CHARSET
        Legend.Channels.Caption.Font.Color = clWhite
        Legend.Channels.Caption.Font.Height = -13
        Legend.Channels.Caption.Font.Name = 'Arial'
        Legend.Channels.Caption.Font.Style = []
        Legend.ChannelLinks.Caption.Font.Charset = DEFAULT_CHARSET
        Legend.ChannelLinks.Caption.Font.Color = clWhite
        Legend.ChannelLinks.Caption.Font.Height = -13
        Legend.ChannelLinks.Caption.Font.Name = 'Arial'
        Legend.ChannelLinks.Caption.Font.Style = []
        Legend.MarkerGroups.Caption.Font.Charset = DEFAULT_CHARSET
        Legend.MarkerGroups.Caption.Font.Color = clWhite
        Legend.MarkerGroups.Caption.Font.Height = -13
        Legend.MarkerGroups.Caption.Font.Name = 'Arial'
        Legend.MarkerGroups.Caption.Font.Style = []
        Legend.Zones.Caption.Font.Charset = DEFAULT_CHARSET
        Legend.Zones.Caption.Font.Color = clWhite
        Legend.Zones.Caption.Font.Height = -13
        Legend.Zones.Caption.Font.Name = 'Arial'
        Legend.Zones.Caption.Font.Style = []
        Legend.Ellipses.Caption.Font.Charset = DEFAULT_CHARSET
        Legend.Ellipses.Caption.Font.Color = clWhite
        Legend.Ellipses.Caption.Font.Height = -13
        Legend.Ellipses.Caption.Font.Name = 'Arial'
        Legend.Ellipses.Caption.Font.Style = []
        Legend.Cursors.Caption.Font.Charset = DEFAULT_CHARSET
        Legend.Cursors.Caption.Font.Color = clWhite
        Legend.Cursors.Caption.Font.Height = -13
        Legend.Cursors.Caption.Font.Name = 'Arial'
        Legend.Cursors.Caption.Font.Style = []
        Legend.CursorLinks.Caption.Font.Charset = DEFAULT_CHARSET
        Legend.CursorLinks.Caption.Font.Color = clWhite
        Legend.CursorLinks.Caption.Font.Height = -13
        Legend.CursorLinks.Caption.Font.Name = 'Arial'
        Legend.CursorLinks.Caption.Font.Style = []
        Legend.CustomGroups = <>
        Title.Align = vaTop
        Title.Text = 'Electrons on level'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -21
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        DataView.Border.Pen.Color = clGreen
        Trails.Font.Charset = DEFAULT_CHARSET
        Trails.Font.Color = clWhite
        Trails.Font.Height = -11
        Trails.Font.Name = 'Arial'
        Trails.Font.Style = []
        Highlighting.MouseHitPoint.PointLabel.Font.Charset = DEFAULT_CHARSET
        Highlighting.MouseHitPoint.PointLabel.Font.Color = clWhite
        Highlighting.MouseHitPoint.PointLabel.Font.Height = -11
        Highlighting.MouseHitPoint.PointLabel.Font.Name = 'Arial'
        Highlighting.MouseHitPoint.PointLabel.Font.Style = []
        MarkerGroups = <>
        Zones = <>
        Ellipses = <>
        Channels = <
          item
            Name = 'Electrons'
            Color = clAqua
            Points.Visible = False
            Points.Shape = psCircle
            Points.Brush.Color = clRed
            Points.Brush.Style = bsSolid
            Points.Pen.Color = clRed
            ChannelMode = cmLine
            ShadeMode = csmZero
            Markers = <>
            AxisIndex_ = (
              0
              0)
          end>
        Cursors = <>
        CursorLinks = <>
        ChannelLinks = <>
      end
    end
    object pLevel: TTabSheet
      Caption = 'Levels'
      ImageIndex = 2
      object sLevel: TSLScope
        Left = 0
        Top = 0
        Width = 886
        Height = 698
        Cursor = crDefault
        Align = alClient
        Zooming.Mode = zmBoth
        NavigateMode = nmZoom
        TabOrder = 0
        InputPins.Count = 3
        InputPins.Form = WinMain
        XInputPins.Count = 3
        XInputPins.Form = WinMain
        YAxis.Align = vaLeft
        YAxis.MinorTicks.Count = 0
        YAxis.MajorTicks.Step = 10.000000000000000000
        YAxis.Font.Charset = DEFAULT_CHARSET
        YAxis.Font.Color = clWhite
        YAxis.Font.Height = -11
        YAxis.Font.Name = 'Arial'
        YAxis.Font.Style = []
        YAxis.AxisLabel.Font.Charset = DEFAULT_CHARSET
        YAxis.AxisLabel.Font.Color = clWhite
        YAxis.AxisLabel.Font.Height = -13
        YAxis.AxisLabel.Font.Name = 'Arial'
        YAxis.AxisLabel.Font.Style = [fsBold]
        YAxis.AxisLabel.Text = 'Electrons'
        YAxis.Format.PrecisionMode = dpmGeneral
        YAxis.Min.Range.High.Enabled = False
        YAxis.Min.Range.Low.Enabled = False
        YAxis.Min.Value = -1000.000000000000000000
        YAxis.Max.Range.High.Enabled = False
        YAxis.Max.Range.Low.Enabled = False
        YAxis.Max.Value = 1000.000000000000000000
        YAxis.Zooming.Range.High.Enabled = False
        YAxis.Zooming.Range.Low.Enabled = True
        YAxis.DataView.Lines.Pen.Color = clGreen
        YAxis.DataView.ZeroLine.Pen.Color = clWhite
        YAxis.AdditionalAxes = <>
        YAxis.MinMax = (
          -1000.000000000000000000
          1000.000000000000000000
          -1000.000000000000000000
          1000.000000000000000000
          -1000.000000000000000000
          1000.000000000000000000
          0.000000100000000000
          100000000.000000000000000000)
        XAxis.Align = vaBottom
        XAxis.MinorTicks.Count = 0
        XAxis.MajorTicks.Step = 10.000000000000000000
        XAxis.Font.Charset = DEFAULT_CHARSET
        XAxis.Font.Color = clWhite
        XAxis.Font.Height = -11
        XAxis.Font.Name = 'Arial'
        XAxis.Font.Style = []
        XAxis.AxisLabel.Font.Charset = DEFAULT_CHARSET
        XAxis.AxisLabel.Font.Color = clWhite
        XAxis.AxisLabel.Font.Height = -13
        XAxis.AxisLabel.Font.Name = 'Arial'
        XAxis.AxisLabel.Font.Style = [fsBold]
        XAxis.AxisLabel.Text = 'Step'
        XAxis.Format.PrecisionMode = dpmGeneral
        XAxis.TicksMode = atmAuto
        XAxis.UnitScale.Exponent = 0
        XAxis.Min.Range.High.Enabled = False
        XAxis.Min.Range.Low.Enabled = False
        XAxis.Min.Tick.Value = 0.000000000000000000
        XAxis.Min.Value = 0.000000000000000000
        XAxis.Max.Range.High.Enabled = False
        XAxis.Max.Range.Low.Enabled = False
        XAxis.Max.Tick.Value = 1024.000000000000000000
        XAxis.Max.Mode = mamValue
        XAxis.Max.Value = 1024.000000000000000000
        XAxis.Zooming.Range.High.Enabled = False
        XAxis.Zooming.Range.Low.Enabled = True
        XAxis.DataView.Lines.Pen.Color = clGreen
        XAxis.DataView.ZeroLine.Pen.Color = clWhite
        XAxis.AdditionalAxes = <>
        XAxis.MinMaxRange = (
          -1000.000000000000000000
          1000.000000000000000000
          -1000.000000000000000000
          1000.000000000000000000
          0.000000100000000000
          100000000.000000000000000000)
        Legend.Align = vaRight
        Legend.Font.Charset = DEFAULT_CHARSET
        Legend.Font.Color = clWhite
        Legend.Font.Height = -11
        Legend.Font.Name = 'Arial'
        Legend.Font.Style = []
        Legend.Channels.Caption.Font.Charset = DEFAULT_CHARSET
        Legend.Channels.Caption.Font.Color = clWhite
        Legend.Channels.Caption.Font.Height = -13
        Legend.Channels.Caption.Font.Name = 'Arial'
        Legend.Channels.Caption.Font.Style = []
        Legend.ChannelLinks.Caption.Font.Charset = DEFAULT_CHARSET
        Legend.ChannelLinks.Caption.Font.Color = clWhite
        Legend.ChannelLinks.Caption.Font.Height = -13
        Legend.ChannelLinks.Caption.Font.Name = 'Arial'
        Legend.ChannelLinks.Caption.Font.Style = []
        Legend.MarkerGroups.Caption.Font.Charset = DEFAULT_CHARSET
        Legend.MarkerGroups.Caption.Font.Color = clWhite
        Legend.MarkerGroups.Caption.Font.Height = -13
        Legend.MarkerGroups.Caption.Font.Name = 'Arial'
        Legend.MarkerGroups.Caption.Font.Style = []
        Legend.Zones.Caption.Font.Charset = DEFAULT_CHARSET
        Legend.Zones.Caption.Font.Color = clWhite
        Legend.Zones.Caption.Font.Height = -13
        Legend.Zones.Caption.Font.Name = 'Arial'
        Legend.Zones.Caption.Font.Style = []
        Legend.Ellipses.Caption.Font.Charset = DEFAULT_CHARSET
        Legend.Ellipses.Caption.Font.Color = clWhite
        Legend.Ellipses.Caption.Font.Height = -13
        Legend.Ellipses.Caption.Font.Name = 'Arial'
        Legend.Ellipses.Caption.Font.Style = []
        Legend.Cursors.Caption.Font.Charset = DEFAULT_CHARSET
        Legend.Cursors.Caption.Font.Color = clWhite
        Legend.Cursors.Caption.Font.Height = -13
        Legend.Cursors.Caption.Font.Name = 'Arial'
        Legend.Cursors.Caption.Font.Style = []
        Legend.CursorLinks.Caption.Font.Charset = DEFAULT_CHARSET
        Legend.CursorLinks.Caption.Font.Color = clWhite
        Legend.CursorLinks.Caption.Font.Height = -13
        Legend.CursorLinks.Caption.Font.Name = 'Arial'
        Legend.CursorLinks.Caption.Font.Style = []
        Legend.CustomGroups = <>
        Title.Align = vaTop
        Title.Text = 'Level statistics'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -21
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        DataView.Border.Pen.Color = clGreen
        Trails.Font.Charset = DEFAULT_CHARSET
        Trails.Font.Color = clWhite
        Trails.Font.Height = -11
        Trails.Font.Name = 'Arial'
        Trails.Font.Style = []
        Highlighting.MouseHitPoint.PointLabel.Font.Charset = DEFAULT_CHARSET
        Highlighting.MouseHitPoint.PointLabel.Font.Color = clWhite
        Highlighting.MouseHitPoint.PointLabel.Font.Height = -11
        Highlighting.MouseHitPoint.PointLabel.Font.Name = 'Arial'
        Highlighting.MouseHitPoint.PointLabel.Font.Style = []
        MarkerGroups = <>
        Zones = <>
        Ellipses = <>
        Channels = <
          item
            Name = 'Level1'
            Color = clAqua
            Points.Visible = False
            Points.Shape = psCircle
            Points.Brush.Color = clRed
            Points.Brush.Style = bsSolid
            Points.Pen.Color = clRed
            ChannelMode = cmLine
            ShadeMode = csmZero
            Markers = <>
            AxisIndex_ = (
              0
              0)
          end
          item
            Name = 'Level2'
            Color = clRed
            Points.Visible = False
            Points.Shape = psCircle
            Points.Brush.Color = clRed
            Points.Brush.Style = bsSolid
            Points.Pen.Color = clRed
            ChannelMode = cmLine
            ShadeMode = csmZero
            Markers = <>
            AxisIndex_ = (
              0
              0)
          end
          item
            Name = 'Level3'
            Color = clLime
            Points.Visible = False
            Points.Shape = psCircle
            Points.Brush.Color = clRed
            Points.Brush.Style = bsSolid
            Points.Pen.Color = clRed
            ChannelMode = cmLine
            ShadeMode = csmZero
            Markers = <>
            AxisIndex_ = (
              0
              0)
          end>
        Cursors = <>
        CursorLinks = <>
        ChannelLinks = <>
      end
    end
  end
  object sb: TStatusBar
    Left = 0
    Top = 751
    Width = 897
    Height = 19
    Color = clSilver
    Panels = <
      item
        Width = 100
      end
      item
        Style = psOwnerDraw
        Width = 50
      end>
    OnDrawPanel = sbDrawPanel
  end
  object pTitle: TPanel
    Left = 0
    Top = 0
    Width = 897
    Height = 25
    Align = alTop
    TabOrder = 2
  end
end
