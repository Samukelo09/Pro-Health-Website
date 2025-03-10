using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(prohealth.Startup))]
namespace prohealth
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
