AtomTfs = require '../lib/atom-tfs'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "AtomTfs", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('atom-tfs')

  describe "when the atom-tfs:open event is triggered", ->
    it "shows the modal panel", ->
      expect(workspaceElement.querySelector('.atomTfs')).not.toExist()
      atom.commands.dispatch workspaceElement, 'atom-tfs:open'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(workspaceElement.querySelector('.atomTfs')).toExist()

        # atomTfsElement = workspaceElement.querySelector('.atom-tfs')
        # expect(atomTfsElement).toExist()

        # atomTfsPanel = atom.workspace.panelForItem(atomTfsElement)
        # expect(atomTfsPanel.isVisible()).toBe true
        # atom.commands.dispatch workspaceElement, 'atom-tfs:toggle'
        # expect(atomTfsPanel.isVisible()).toBe false

    # it "hides and shows the view", ->
      # This test shows you an integration test testing at the view level.

      # Attaching the workspaceElement to the DOM is required to allow the
      # `toBeVisible()` matchers to work. Anything testing visibility or focus
      # requires that the workspaceElement is on the DOM. Tests that attach the
      # workspaceElement to the DOM are generally slower than those off DOM.
      # jasmine.attachToDOM(workspaceElement)

      # expect(workspaceElement.querySelector('.atom-tfs')).not.toExist()

      # This is an activation event, triggering it causes the package to be
      # activated.
      # atom.commands.dispatch workspaceElement, 'atom-tfs:toggle'

      # waitsForPromise ->
        # activationPromise

      # runs ->
        # Now we can test for view visibility
        # atomTfsElement = workspaceElement.querySelector('.atom-tfs')
        # expect(atomTfsElement).toBeVisible()
        # atom.commands.dispatch workspaceElement, 'atom-tfs:toggle'
        # expect(atomTfsElement).not.toBeVisible()
