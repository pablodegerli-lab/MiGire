inherited DMAbmDet: TDMAbmDet
  OldCreateOrder = True
  Left = 59
  Top = 93
  inherited QryCab: TADOQuery
    AfterPost = QryCabAfterPost
    AfterScroll = QryCabAfterScroll
  end
  object QryDet: TADOQuery
    CursorType = ctDynamic
    BeforeOpen = QryDetBeforeOpen
    BeforeClose = QryDetBeforeClose
    AfterInsert = QryDetAfterInsert
    BeforePost = QryDetBeforePost
    BeforeDelete = QryCabBeforeDelete
    OnDeleteError = QryCabDeleteError
    OnEditError = QryCabEditError
    OnPostError = QryCabPostError
    ParamCheck = False
    Parameters = <>
    Left = 16
    Top = 96
  end
end
