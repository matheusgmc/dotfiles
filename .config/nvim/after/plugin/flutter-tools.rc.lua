local status, ft = pcall(require,'flutter-tools');

if (not status) then return end

ft.setup {
}
