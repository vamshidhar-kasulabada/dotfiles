return{
    getHomePath = function()
        local home = os.getenv("HOME") or os.getenv("USERPROFILE")
        return home
    end;
}
