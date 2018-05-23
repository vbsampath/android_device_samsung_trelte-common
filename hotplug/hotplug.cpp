#include <sys/stat.h>
#include <errno.h>
#include <unistd.h>
#include <cstdlib>
#include <string>

#define LOG_TAG "hotplug"
#include <utils/Log.h>

extern char **environ;

class EventScript
{
    char m_sFilename[PATH_MAX];
public:
    EventScript(const char *event_type, const char *hotplug_dir);
    bool IsExecutable();
    const char* Filename() { return (const char *)m_sFilename; }
};

EventScript::EventScript(const char *event_type, const char *hotplug_dir)
{
    snprintf(m_sFilename, PATH_MAX, "%s/%s.agent", hotplug_dir, event_type);
}

bool EventScript::IsExecutable()
{
    struct stat sb;
    return ((stat(m_sFilename, &sb) == 0) && (sb.st_mode & S_IXUSR));
}

class Environment 
{
    std::string m_sAction;
    std::string m_sDevpath;
public:
    Environment();
    bool IsValid()        { return !m_sAction.empty() && !m_sDevpath.empty(); }
    const char* Action()  { return m_sAction.c_str(); }
    const char* Devpath() { return m_sDevpath.c_str(); }
};

Environment::Environment()
{
    m_sAction = std::getenv("ACTION");
    m_sDevpath = std::getenv("DEVPATH");
}

int main(int argc, char *argv[])
{
    if (fork() == 0)
    {
        if (argc > 1)
        {
            Environment e;

            if (e.IsValid())
            {
                ALOGV("(%s) ACTION=%s DEVPATH=%s", argv[1], e.Action(), e.Devpath());
                EventScript s(argv[1], "/system/etc/hotplug");

                if (s.IsExecutable())
                {
                    setuid(1000); setgid(1000);
                    setenv("PATH", "/system/bin:/system/xbin:/sbin", 1);
                    execvpe(s.Filename(), argv, environ);
                    ALOGE("error in execvpe(%s) %s", s.Filename(), strerror(errno));
                }
            }
        }
    }
    return(0);
}
