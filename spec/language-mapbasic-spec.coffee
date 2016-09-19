{WorkspaceView} = require 'atom'
LanguagePurebasic = require '../lib/language-mapbasic'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "LanguagePurebasic", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('language-mapbasic')

  describe "when the language-mapbasic:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.language-mapbasic')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'language-mapbasic:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.language-mapbasic')).toExist()
        atom.workspaceView.trigger 'language-mapbasic:toggle'
        expect(atom.workspaceView.find('.language-mapbasic')).not.toExist()
