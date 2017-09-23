using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(GridViewADONET.Startup))]
namespace GridViewADONET
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
