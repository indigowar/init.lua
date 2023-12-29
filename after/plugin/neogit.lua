local neogit = require('neogit')

neogit.setup {
  filewatcher = {
    interval = 1000,
    enabled = true,
  },
  git_services = {
    ['github.com'] = 'https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1',
    ['bitbucket.org'] = 'https://bitbucket.org/${owner}/${repository}/pull-requests/new?source=${branch_name}&t=1',
    ['gitlab.com'] = 'https://gitlab.com/${owner}/${repository}/merge_requests/new?merge_request[source_branch]=${branch_name}',
  },
  telescope_sorter = function()
    return require('telescope').extensions.fzf.native_fzf_sorter()
  end,
  ignored_settings = {
    'NeogitPushPopup--force-with-lease',
    'NeogitPushPopup--force',
    'NeogitPullPopup--rebase',
    'NeogitCommitPopup--allow-empty',
    'NeogitRevertPopup--no-edit',
  },
  use_default_keymaps = true,
  auto_refresh = true,
  sort_branches = '-committerdate',
  kind = 'tab',
  disable_line_numbers = true,
  console_timeout = 2000,
  auto_show_console = true,
  status = {
    recent_commit_count = 10,
  },
  commit_editor = {
    kind = 'auto',
  },
  commit_select_view = {
    kind = 'tab',
  },
  commit_view = {
    kind = 'vsplit',
    verify_commit = os.execute('which gpg') == 0, -- Can be set to true or false, otherwise we try to find the binary
  },
  log_view = {
    kind = 'tab',
  },
  rebase_editor = {
    kind = 'auto',
  },
  reflog_view = {
    kind = 'tab',
  },
  merge_editor = {
    kind = 'auto',
  },
  tag_editor = {
    kind = 'auto',
  },
  preview_buffer = {
    kind = 'split',
  },
  popup = {
    kind = 'split',
  },
  signs = {
    -- { CLOSED, OPENED }
    hunk = { '', '' },
    item = { '>', 'v' },
    section = { '>', 'v' },
  },
  -- Each Integration is auto-detected through plugin presence, however, it can be disabled by setting to `false`
  integrations = {
    -- If enabled, use telescope for menu selection rather than vim.ui.select.
    -- Allows multi-select and some things that vim.ui.select doesn't.
    telescope = nil,
    -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `diffview`.
    -- The diffview integration enables the diff popup.
    --
    -- Requires you to have `sindrets/diffview.nvim` installed.
    diffview = nil,

    -- If enabled, uses fzf-lua for menu selection. If the telescope integration
    -- is also selected then telescope is used instead
    -- Requires you to have `ibhagwan/fzf-lua` installed.
    fzf_lua = nil,
  },
  sections = {
    -- Reverting/Cherry Picking
    sequencer = {
      folded = false,
      hidden = false,
    },
    untracked = {
      folded = false,
      hidden = false,
    },
    unstaged = {
      folded = false,
      hidden = false,
    },
    staged = {
      folded = false,
      hidden = false,
    },
    stashes = {
      folded = true,
      hidden = false,
    },
    unpulled_upstream = {
      folded = true,
      hidden = false,
    },
    unmerged_upstream = {
      folded = false,
      hidden = false,
    },
    unpulled_pushRemote = {
      folded = true,
      hidden = false,
    },
    unmerged_pushRemote = {
      folded = false,
      hidden = false,
    },
    recent = {
      folded = true,
      hidden = false,
    },
    rebase = {
      folded = true,
      hidden = false,
    },
  },
  mappings = {
    commit_editor = {
      ['q'] = 'Close',
      ['<c-c><c-c>'] = 'Submit',
      ['<c-c><c-k>'] = 'Abort',
    },
    rebase_editor = {
      ['p'] = 'Pick',
      ['r'] = 'Reword',
      ['e'] = 'Edit',
      ['s'] = 'Squash',
      ['f'] = 'Fixup',
      ['x'] = 'Execute',
      ['d'] = 'Drop',
      ['b'] = 'Break',
      ['q'] = 'Close',
      ['<cr>'] = 'OpenCommit',
      ['gk'] = 'MoveUp',
      ['gj'] = 'MoveDown',
      ['<c-c><c-c>'] = 'Submit',
      ['<c-c><c-k>'] = 'Abort',
    },
    finder = {
      ['<cr>'] = 'Select',
      ['<c-c>'] = 'Close',
      ['<esc>'] = 'Close',
      ['<c-n>'] = 'Next',
      ['<c-p>'] = 'Previous',
      ['<down>'] = 'Next',
      ['<up>'] = 'Previous',
      ['<tab>'] = 'MultiselectToggleNext',
      ['<s-tab>'] = 'MultiselectTogglePrevious',
      ['<c-j>'] = 'NOP',
    },
    -- Setting any of these to `false` will disable the mapping.
    popup = {
      ['?'] = 'HelpPopup',
      ['A'] = 'CherryPickPopup',
      ['D'] = 'DiffPopup',
      ['M'] = 'RemotePopup',
      ['P'] = 'PushPopup',
      ['X'] = 'ResetPopup',
      ['Z'] = 'StashPopup',
      ['b'] = 'BranchPopup',
      ['c'] = 'CommitPopup',
      ['f'] = 'FetchPopup',
      ['l'] = 'LogPopup',
      ['m'] = 'MergePopup',
      ['p'] = 'PullPopup',
      ['r'] = 'RebasePopup',
      ['v'] = 'RevertPopup',
    },
    status = {
      ['q'] = 'Close',
      ['I'] = 'InitRepo',
      ['1'] = 'Depth1',
      ['2'] = 'Depth2',
      ['3'] = 'Depth3',
      ['4'] = 'Depth4',
      ['<tab>'] = 'Toggle',
      ['x'] = 'Discard',
      ['s'] = 'Stage',
      ['S'] = 'StageUnstaged',
      ['<c-s>'] = 'StageAll',
      ['u'] = 'Unstage',
      ['U'] = 'UnstageStaged',
      ['d'] = 'DiffAtFile',
      ['$'] = 'CommandHistory',
      ['#'] = 'Console',
      ['Y'] = 'YankSelected',
      ['<c-r>'] = 'RefreshBuffer',
      ['<enter>'] = 'GoToFile',
      ['<c-v>'] = 'VSplitOpen',
      ['<c-x>'] = 'SplitOpen',
      ['<c-t>'] = 'TabOpen',
      ['{'] = 'GoToPreviousHunkHeader',
      ['}'] = 'GoToNextHunkHeader',
    },
  },
}