{WorkspaceView} = require 'atom'
LanguagePurebasic = require '../lib/language-purebasic'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "LanguagePurebasic", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('language-purebasic')

  describe "when the language-purebasic:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.language-purebasic')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'language-purebasic:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.language-purebasic')).toExist()
        atom.workspaceView.trigger 'language-purebasic:toggle'
        expect(atom.workspaceView.find('.language-purebasic')).not.toExist()
