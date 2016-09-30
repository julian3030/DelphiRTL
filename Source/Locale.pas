﻿namespace Elements.RTL.Delphi;

interface

type
  TLanguages = public class
  private
    class method GetInvariantLocale: TLocaleID;
    class method GetUserDefaultLocale: TLocaleID;
  public
    class function GetLocaleIDFromLocaleName(const LocaleName: DelphiString): TLocaleID;
    class property UserDefaultLocale: TLocaleID read GetUserDefaultLocale;
    class property InvariantLocale: TLocaleID read GetInvariantLocale;
  end;

implementation

class method TLanguages.GetLocaleIDFromLocaleName(LocaleName: DelphiString): TLocaleID;
begin
  {$IF COOPER}
  result := new java.util.Locale(LocaleName);
  {$ELSEIF ECHOES}
  result := new System.Globalization.CultureInfo(LocaleName);
  {$ELSEIF TOFFEE}
  result := NSLocale.localeWithLocaleIdentifier(NSLocale.canonicalLanguageIdentifierFromString(LocaleName));
  {$ENDIF}
end;

class method TLanguages.GetUserDefaultLocale: TLocaleID;
begin
  result := Sugar.Locale.Current;
end;

class method TLanguages.GetInvariantLocale: TLocaleID;
begin
  result := Sugar.Locale.Invariant;
end;

end.