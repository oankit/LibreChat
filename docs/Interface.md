Interface Object Structure
Overview
The interface object allows for customization of various user interface elements within the application, including visibility and behavior settings for components such as menus, panels, and links. This section provides a detailed breakdown of the interface object structure.

These are fields under interface:

mcpServers
privacyPolicy
termsOfService
modelSelect
parameters
sidePanel
presets
prompts
bookmarks
multiConvo
agents
customWelcome
runCode
webSearch
fileSearch
Notes:

The interface configurations are applied globally within the application.
Default values are provided for most settings but can be overridden based on specific requirements or conditions.
Conditional logic in the application can further modify these settings based on other configurations like model specifications.
Example
interface

interface:
  mcpServers:
    placeholder: "MCP Servers"
  privacyPolicy:
    externalUrl: "https://example.com/privacy"
    openNewTab: true
  termsOfService:
    externalUrl: "https://example.com/terms"
    openNewTab: true
    modalAcceptance: true
    modalTitle: "Terms of Service"
    modalContent: |
      # Terms of Service
      ## Introduction
      Welcome to LibreChat!
  modelSelect: false
  parameters: true
  sidePanel: true
  presets: false
  prompts: true
  bookmarks: true
  multiConvo: true
  agents: true
  customWelcome: "Hey {{user.name}}! Welcome to LibreChat"
  runCode: true
  webSearch: true
  fileSearch: true
mcpServers
Key:

Key	Type	Description	Example
mcpServers	Object	Contains settings related to the MCP (Model Context Protocol) server selection interface.	Allows for customization of the placeholder text shown in the MCP server selection dropdown.
Sub-keys:

Key	Type	Description	Example
placeholder	String	The placeholder text displayed in the MCP server selection dropdown when no server is selected.	MCP Servers
privacyPolicy
Key:

Key	Type	Description	Example
privacyPolicy	Object	Contains settings related to the privacy policy link provided in the user interface.	Allows for the specification of a custom URL and the option to open it in a new tab.
Sub-keys:

Key	Type	Description	Example
externalUrl	String (URL)	The URL pointing to the privacy policy document.	
openNewTab	Boolean	Specifies whether the link should open in a new tab.	
termsOfService
Key:

Key	Type	Description	Example
termsOfService	Object	Contains settings related to the terms of service link provided in the user interface.	Allows for the specification of a custom URL and the option to open it in a new tab, as well as a modal acceptance dialog for the terms of service.
Sub-keys:

Key	Type	Description	Example
externalUrl	String (URL)	The URL pointing to the terms of service document.	https://librechat.ai/tos
openNewTab	Boolean	Specifies whether the link should open in a new tab.	true
modalAcceptance	Boolean	Specifies whether to show a modal terms and conditions dialog for users to accept in order to be able to use LibreChat.	true
modalTitle	String	Specifies a custom title for the modal terms and conditions dialog (optional).	Terms of Service
modalContent	String	Specifies the content of the modal terms and conditions dialog in MarkDown format.	See librechat.yaml.example for how to correctly format the multi-line parameter.
modelSelect
Key:

Key	Type	Description	Example
modelSelect	Boolean	Determines whether the model selection feature is available in the UI.	Enabling this feature allows users to select different models directly from the interface.
Default: true

Notes:

This is required to be true if using modelSpecs.addedEndpoints.
If modelSpecs.addedEndpoints is used and interface.modelSelect is not explicitly set, it defaults to true.
Example:

interface / modelSelect

interface:
  modelSelect: true
parameters
Key:

Key	Type	Description	Example
parameters	Boolean	Toggles the visibility of parameter configuration options within the interface.	This setting is crucial for users who need to adjust parameters for specific functionalities within the application.
Default: true

Example:

interface / parameters

interface:
  parameters: false
sidePanel
Key:

Key	Type	Description	Example
sidePanel	Boolean	Controls the visibility of the side panel in the application's interface.	The side panel typically contains additional navigation or information relevant to the application's context.
Default: true

Example:

interface / sidePanel

interface:
  sidePanel: true
presets
Key:

Key	Type	Description	Example
presets	Boolean	Enables or disables the use of presets in the application's UI.	Presets can simplify user interactions by providing pre-configured settings or operations, enhancing user experience and efficiency.
Default: true

Example:

interface / presets

interface:
  presets: true
prompts
Key:

Key	Type	Description	Example
prompts	Boolean	Enables or disables all prompt-related features for all users.	When disabled, users will not have access to create, edit, or use custom prompts within the application.
Default: true

Example:

interface / prompts

interface:
  prompts: false
bookmarks
Key:

Key	Type	Description	Example
bookmarks	Boolean	Enables or disables all bookmarks-related features for all users.	When disabled, users will not be able to create, manage, or access bookmarks within the application.
Default: true

Example:

interface / bookmarks

interface:
  bookmarks: true
multiConvo
Key:

Key	Type	Description	Example
multiConvo	Boolean	Enables or disables all "multiConvo", AKA multiple response streaming, related features for all users.	When disabled, users will not be able to stream responses from 2 AI models at the same time.
Default: true

Example:

interface / multiConvo

interface:
  multiConvo: true
agents
More info on Agents

Key:

Key	Type	Description	Example
agents	Boolean	Enables or disables use of the Agents	
Default: true

Example:

interface / agents

interface:
  agents: true
customWelcome
Key:

Key	Type	Description	Example
customWelcome	String	Allows administrators to define a custom welcome message for the chat interface, with the option to personalize it using the {{user.name}} parameter.	
Default: None (if not specified, a default greeting is used)

Example:

interface / customWelcome

interface:
    customWelcome: "Hey {{user.name}}! Welcome to LibreChat"
Note: You can use {{user.name}} within the customWelcome message to dynamically insert the user’s name for a personalized greeting experience.

runCode
Enables/disables the “Run Code” button for Markdown Code Blocks. More info on the LibreChat Code Interpreter API

Note: This setting does not disable the Agents Code Interpreter Capability. To disable the Agents Capability, see the Agents Endpoint configuration instead.

Key:

Key	Type	Description	Example
runCode	Boolean	Enables or disables the "Run Code" button for Markdown Code Blocks.	
Default: true

Example:

interface / runCode

interface:
  runCode: true
webSearch
Enables/disables the web search button in the chat interface. More info on Web Search Configuration

Note: This setting does not disable the Agents Web Search Capability. To disable the Agents Capability, see the Agents Endpoint configuration instead.

Key:

Key	Type	Description	Example
webSearch	Boolean	Enables or disables the web search button in the chat interface.	
Default: true

Example:

interface / webSearch

interface:
  webSearch: true
fileSearch
Enables/disables the file search (for RAG API usage via tool) button in the chat interface

Note: This setting does not disable the Agents File Search Capability. To disable the Agents Capability, see the Agents Endpoint configuration instead.

Key:

Key	Type	Description	Example
fileSearch	Boolean	Enables or disables the file search button in the chat interface.	
Default: true

Example:

interface / fileSearch

interface:
  fileSearch: true
