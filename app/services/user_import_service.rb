class UserImportService
    def initialize( params = {})
        @params = params
        @params ||= {}
    end

    def call 
        spreadsheet = open_spreadsheet(@params)
        header = spreadsheet.row(1)
        (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        p row
        user = find_by_id(row["id"]) || new
        p user
        user.attributes = row.to_hash.slice(*accessible_attributes)
        user.save!
        end
    end
    private 
    def open_spreadsheet(params)
        case File.extname(file.original_filename)
        when ".csv" then Csv.new(file.path, nil, :ignore)
        when ".xls" then Excel.new(file.path, nil, :ignore)
        when ".xlsx" then Excelx.new(file.path, nil, :ignore)
        else raise "Unknown file type: #{file.original_filename}"
        end
    end
end