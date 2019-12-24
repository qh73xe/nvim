import neovim


@neovim.plugin
class EditUtil(object):
    def __init__(self, nvim):
        self.nvim = nvim

    def echo(self, msg):
        self.nvim.command("echo '{}'".format(msg))

    def get_pos(self, arg):
        pass

    @neovim.command("AsOneLine", range='', nargs='*')
    def asOneLine(self, args, range):
        cmd = 'getpos(\"{}\")'.format("'<")
        self.echo(cmd)

    @neovim.autocmd(
        'BufEnter', pattern='*.py', eval='expand("<afile>")', sync=True
    )
    def on_bufenter(self, filename):
        self.nvim.out_write("testplugin is in " + filename + "\n")
