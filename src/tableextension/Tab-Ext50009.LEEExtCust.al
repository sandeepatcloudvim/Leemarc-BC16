tableextension 50009 "LEE_Ext_Cust" extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Customer Category"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = ,Custom,IBD,Major,SLD,BRW,IND,GRS,CHR,SPN;
        }
    }

    var
        myInt: Integer;
}