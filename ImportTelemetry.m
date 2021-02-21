function telemetryData = ImportTelemetry(fileName)
    opts = delimitedTextImportOptions("NumVariables", 29);

    % Specify range and delimiter
    opts.DataLines = [1, Inf];
    opts.Delimiter = ",";

    % Specify column names and types
    opts.VariableNames = ["SatelliteDateTimeUTC", "SolarPanelVoltageXMV", "SolarPanelVoltageYMV", "SolarPanelVoltageZMV", "TotalPhotoCurrentMA", "BatteryVoltageMV", "TotalSystemCurrentMA", "BoostConverterTemp1C", "BoostConverterTemp2C", "BoostConverterTemp3C", "BatteryTempC", "SunSensorX", "SunSensorY", "SunSensorZ", "SolarPanelTempXC", "SolarPanelTempXC1", "SolarPanelTempYC", "SolarPanelTempYC1", "BusVoltageMV", "BusCurrentMA", "BusVoltageMV1", "RFTemperatureC", "ReceiveCurrentMA", "RFCurrent33VBusMA", "RFCurrent50VBusMA", "PADeviceTemperatureC", "PABusCurrentMA", "AntennaTemp0C", "AntennaTemp1C"];
    opts.VariableTypes = ["datetime", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

    % Specify file level properties
    opts.ExtraColumnsRule = "ignore";
    opts.EmptyLineRule = "read";

    % Specify variable properties
    opts = setvaropts(opts, "SatelliteDateTimeUTC", "InputFormat", "yyyy-MM-dd HH:mm:ss.SSS");

    % Import the data
    telemetryData = readtable(fileName, opts);
    
    % Remove 1st row, which is read as the title.
    telemetryData([1], :) = [];
end