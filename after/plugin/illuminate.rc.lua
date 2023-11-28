local status, illuminate = pcall(require, "illuminate")
if (not status) then return end

illuminate.configure {
  under_cursor = true
}
